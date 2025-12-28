import 'dart:js_interop';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_untitled/features/profile/data/profile_model.dart';
import 'package:new_untitled/services/storage/storage_services.dart';
import 'package:new_untitled/utils/helpers/other_helper.dart';

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

  /// form key here
  final formKey = GlobalKey<FormState>();

  /// select Language here
  String selectedLanguage = "English";

  /// select image here
  String? image;

  /// edit button loading here
  bool isLoading = false;

  /// all controller here
  TextEditingController bioController = TextEditingController(
    text: kDebugMode ? "“Wandering through Washington”" : "",
  );
  TextEditingController locationController = TextEditingController(
    text: kDebugMode ? "Seattle WA" : "",
  );

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProfile();
  }

  /// select image function here
  getProfileImage() async {
    image = await OtherHelper.openGalleryForProfile();
    update();
  }

  void fetchProfile() async {
    final response = await ApiService.get(ApiEndPoint.user);
    if (response.isSuccess) {
      final data = response.data;
      user.value = ProfileModel.fromJson(data['data']);
      update();
    } else {
      Get.snackbar("Error", response.message);
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
      Get.toNamed(AppRoutes.addPhoto);
    } else if (value == "Location") {
      Get.toNamed(AppRoutes.addLocation);
    } else if (value == "Bio") {
      Get.toNamed(AppRoutes.addBio);
    }
    PopupController().hide();
  }

  /// update profile function here
  Future<void> editProfileRepo() async {
    if (!formKey.currentState!.validate()) return;

    if (!LocalStorage.isLogIn) return;
    isLoading = true;
    update();

    Map<String, String> body = {
      // "fullName": nameController.text,
      // "phone": numberController.text,
    };

    var response = await ApiService.multipart(
      ApiEndPoint.user,
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
      LocalStorage.setString("myImage", LocalStorage.myImage);
      LocalStorage.setString("myName", LocalStorage.myName);
      LocalStorage.setString("myEmail", LocalStorage.myEmail);

      Utils.successSnackBar("Successfully Profile Updated", response.message);
      Get.toNamed(AppRoutes.profile);
    } else {
      Utils.errorSnackBar(response.statusCode, response.message);
    }

    isLoading = false;
    update();
  }
}
