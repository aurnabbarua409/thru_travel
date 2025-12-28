import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:new_untitled/utils/helpers/other_helper.dart';
import 'package:new_untitled/utils/log/error_log.dart';

import '../../../../../config/route/app_routes.dart';
import '../../../../../services/api/api_service.dart';
import '../../../../../services/storage/storage_keys.dart';
import '../../../../../config/api/api_end_point.dart';
import '../../../../../services/storage/storage_services.dart';
import '../../../../../utils/app_utils.dart';

class SignUpController extends GetxController {
  /// Sign Up Form Key
  final signUpFormKey = GlobalKey<FormState>();

  bool isPopUpOpen = false;
  bool isLoading = false;
  bool isLoadingVerify = false;

  Timer? _timer;
  int start = 0;

  String time = "";

  List selectedOption = ["User", "Consultant"];

  String selectRole = "User";
  String countryCode = "+880";
  String? image;

  getProfileImage() async {
    image = await OtherHelper.openGallery();
    update();
  }

  String signUpToken = '';

  static SignUpController get instance => Get.put(SignUpController());

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  onCountryChange(Country value) {
    countryCode = value.dialCode.toString();
  }

  setSelectedRole(value) {
    selectRole = value;
    update();
  }

  openGallery() async {
    image = await OtherHelper.openGallery();
    update();
  }

  signUpUser() async {
    if (!signUpFormKey.currentState!.validate()) return;
    // Get.toNamed(AppRoutes.verifyUser);
    // return;
    isLoading = true;
    update();
    Map<String, String> body = {
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
      "name":
          "${firstNameController.text.trim()} ${lastNameController.text.trim()}",
      "phone": numberController.text.trim(),
    };

    try {
      var response = await ApiService.post(ApiEndPoint.signUp, body: body);

      if (response.statusCode == 200) {
        var data = response.data;
        // signUpToken = data['data']['signUpToken'];
        Get.toNamed(AppRoutes.verifyUser);
      } else {
        Utils.errorSnackBar(response.statusCode.toString(), response.message);
      }
    } catch (e) {
      errorLog("error in signup: $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  void startTimer() {
    _timer?.cancel(); // Cancel any existing timer
    start = 180; // Reset the start value
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start > 0) {
        start--;
        final minutes = (start ~/ 60).toString().padLeft(2, '0');
        final seconds = (start % 60).toString().padLeft(2, '0');

        time = "$minutes:$seconds";

        update();
      } else {
        _timer?.cancel();
      }
    });
  }

  Future<void> verifyOtpRepo() async {
    // print('Before navigation');
    // Get.toNamed(AppRoutes.signIn);
    // print('After navigation');

    // return;

    isLoadingVerify = true;
    update();
    Map<String, String> body = {
      "email": emailController.text.trim(),
      "type": "account_activation",
      "oneTimeCode": otpController.text,
    };
    // Map<String, String> header = {"SignUpToken": "signUpToken $signUpToken"};
    try {
      var response = await ApiService.post(
        ApiEndPoint.verifyEmail,
        body: body,
        // header: header,
      );

      if (response.statusCode == 200) {
        _timer?.cancel();
        var data = response.data;

        LocalStorage.token = data['data']["accessToken"];

        LocalStorage.myName =
            "${firstNameController.text.trim()} ${lastNameController.text.trim()}";
        LocalStorage.myEmail = emailController.text.trim();
        LocalStorage.isLogIn = true;

        LocalStorage.setBool(LocalStorageKeys.isLogIn, LocalStorage.isLogIn);
        LocalStorage.setString(LocalStorageKeys.token, LocalStorage.token);
        ;
        LocalStorage.setString(LocalStorageKeys.myName, LocalStorage.myName);
        LocalStorage.setString(LocalStorageKeys.myEmail, LocalStorage.myEmail);

        Get.offAllNamed(AppRoutes.home);
        // if (LocalStorage.myRole == 'consultant') {
        //   Get.toNamed(AppRoutes.personalInformation);
        // } else {
        //   Get.offAllNamed(AppRoutes.patientsHome);
        // }
      } else {
        Get.snackbar(response.statusCode.toString(), response.message);
      }
    } catch (e) {
      errorLog("error in signup verify: $e");
    } finally {
      isLoadingVerify = false;
      update();
    }
  }
}
