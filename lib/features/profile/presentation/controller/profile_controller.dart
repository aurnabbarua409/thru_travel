import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:new_untitled/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:new_untitled/features/home/presentation/controller/home_controller.dart';
import 'package:new_untitled/features/profile/data/plan_model.dart';
import 'package:new_untitled/features/profile/data/profile_model.dart';
import 'package:new_untitled/services/storage/storage_keys.dart';
import 'package:new_untitled/services/storage/storage_services.dart';
import 'package:new_untitled/utils/constants/app_images.dart';
import 'package:new_untitled/utils/helpers/other_helper.dart';
import 'package:new_untitled/utils/log/error_log.dart';

import '../../../../config/api/api_end_point.dart';
import '../../../../config/route/app_routes.dart';
import '../../../../services/api/api_service.dart';
import '../../../../utils/app_utils.dart';
import '../../../../utils/log/app_log.dart';
import '../../../trip/presentation/widgets/pop_up.dart';

class ProfileController extends GetxController {
  /// Language List here
  List languages = ["English", "French", "Arabic"];

  final List<String> options = ['Profile Picture', 'Location', 'Bio'];

  final user = Rxn<ProfileModel>();
  final plans = <PlanModel>[].obs;
  final profileLoading = false.obs;
  final planLoading = false.obs;

  /// form key here
  final formKey = GlobalKey<FormState>();

  /// select Language here
  String selectedLanguage = "English";

  /// select image here
  String? image;

  /// edit button loading here
  bool isLoading = false;

  /// all controller here
  TextEditingController bioController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProfile();
    fetchPlan();
  }

  /// select image function here
  getProfileImage() async {
    image = await OtherHelper.openGalleryForProfile();
    update();
    // editProfilePicture();
  }

  // void editProfilePicture() async {
  //   try {
  //     await ApiService.multipart(
  //       ApiEndPoint.uploadImage,
  //       body: {
  //         'data': jsonEncode({"type": "profile"}),
  //       },
  //       imagePath: image,
  //       imageName: "images",
  //     );
  //   } catch (e) {
  //     errorLog("error in upload image: $e");
  //   }
  // }

  void editProfilePicture() async {
    if (image == null) return;
    final url = "${ApiEndPoint.baseUrl}${ApiEndPoint.uploadImage}";
    try {
      final dio = Dio();
      final formData = FormData.fromMap({
        'data': jsonEncode({"type": "profile"}),
        'images': await MultipartFile.fromFile(image!),
      });
      appLog("url: $url \n for image: ${formData.fields}, ${formData.files}");
      final response = await dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            'Authorization': "Bearer ${LocalStorage.token}",
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
      if (response.statusCode == 200) {
        Utils.snackBar(response.data['message']);
        fetchProfile();
        Get.back();
      } else {
        Utils.snackBar(response.data['message']);
      }
    } on DioException catch (e) {
      errorLog("error fron dio uploading picture: ${e.message}");
    } catch (e) {
      errorLog("error in uploading picture: $e");
    }
  }

  void fetchProfile() async {
    profileLoading.value = true;
    update();
    try {
      final response = await ApiService.get(ApiEndPoint.userProfile);
      if (response.isSuccess) {
        final data = response.data;
        user.value = ProfileModel.fromJson(data['data']);
        LocalStorage.userId = user.value!.id;
        LocalStorage.myImage = user.value!.profile;
        LocalStorage.myName = user.value!.name;
        CommonBottomNavBar.profileImage.value = LocalStorage.myImage;
        Get.find<HomeController>().setUserName(user.value!.name);
        update();
        LocalStorage.setString(LocalStorageKeys.myImage, LocalStorage.myImage!);
        LocalStorage.setString(LocalStorageKeys.userId, LocalStorage.userId);
      } else {
        Utils.snackBar(response.message);
      }
    } catch (e) {
      errorLog("error in fetching profile: $e");
    } finally {
      profileLoading.value = false;
      update();
    }
  }

  /// select language  function here
  selectLanguage(int index) {
    selectedLanguage = languages[index];
    update();
    Get.back();
  }

  onChangeOption(String value) {
    appLog(value);
    if (value == "Profile Picture") {
      Get.toNamed(AppRoutes.editProfile);
    } else if (value == "Location") {
      Get.toNamed(AppRoutes.addLocation);
    } else if (value == "Bio") {
      Get.toNamed(AppRoutes.addBio);
    }
    PopupController().hide();
  }

  void editBio() async {
    try {
      final response = await ApiService.patch(
        ApiEndPoint.userProfile,
        body: {'bio': bioController.text.trim()},
      );
      if (response.isSuccess) {
        user.value!.bio = bioController.text.trim();
        bioController.clear();
        update();
        Utils.snackBar(response.message);
      } else {
        Utils.snackBar(response.message);
      }
    } catch (e) {
      errorLog("error in editing bio: $e");
    }
  }

  void editLocation() async {
    try {
      final response = await ApiService.patch(
        ApiEndPoint.userProfile,
        body: {'address': locationController.text.trim()},
      );
      if (response.isSuccess) {
        user.value!.address = locationController.text.trim();
        locationController.clear();
        update();
        Utils.snackBar(response.message);
      } else {
        Utils.snackBar(response.message);
      }
    } catch (e) {
      errorLog("error in editing location: $e");
    }
  }

  void fetchPlan() async {
    planLoading.value = true;
    update();
    try {
      final response = await ApiService.get(ApiEndPoint.plan);
      if (response.isSuccess) {
        final data = response.data;
        final temp = data['data'] as List;
        if (temp.isNotEmpty) {
          plans.value = temp.map((e) => PlanModel.fromJson(e)).toList();
          update();
        }
      } else {
        Utils.snackBar(response.message);
      }
    } catch (e) {
      errorLog("error in fetching plan: $e");
    } finally {
      planLoading.value = false;
      update();
    }
  }

  /// update profile function here
  Future<void> editProfileRepo() async {
    if (!formKey.currentState!.validate()) return;

    if (!LocalStorage.isLogIn) return;
    isLoading = true;
    update();

    Map<String, String> body = {
      // "name": "",
      // "lastName": "Doe",
      // "phone": "123456789",
      // "address": "123 Main St",
      // "bio": "Hello world",
      // "longitude": '22.43',
      // "latitude": '24.50',
    };

    var response = await ApiService.multipart(
      ApiEndPoint.userProfile,
      body: body,
      imagePath: image,
      imageName: "image",
    );

    if (response.statusCode == 200) {
      var data = response.data;

      LocalStorage.userId = data['data']?["_id"] ?? "";
      LocalStorage.myImage = data['data']?["image"] ?? "";
      LocalStorage.myName = data['data']?["fullName"] ?? "";
      LocalStorage.myEmail = data['data']?["email"] ?? "";

      LocalStorage.setString("userId", LocalStorage.userId);
      LocalStorage.setString("myImage", LocalStorage.myImage!);
      LocalStorage.setString("myName", LocalStorage.myName);
      LocalStorage.setString("myEmail", LocalStorage.myEmail);

      Utils.snackBar(response.message);
      Get.toNamed(AppRoutes.profile);
    } else {
      Utils.snackBar(response.message);
    }

    isLoading = false;
    update();
  }
}
