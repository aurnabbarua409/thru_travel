import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_untitled/utils/log/error_log.dart';
import '../../../../../config/route/app_routes.dart';
import '../../../../../services/api/api_service.dart';
import '../../../../../config/api/api_end_point.dart';
import '../../../../../services/storage/storage_keys.dart';
import '../../../../../services/storage/storage_services.dart';

class SignInController extends GetxController {
  /// Sign in Button Loading variable
  bool isLoading = false;

  /// Sign in form key , help for Validation
  final formKey = GlobalKey<FormState>();

  /// email and password Controller here
  TextEditingController emailController = TextEditingController(
    text: kDebugMode ? 'raxijos373@mekuron.com' : '',
  );
  TextEditingController passwordController = TextEditingController(
    text: kDebugMode ? '1234567a' : "",
  );

  /// Sign in Api call here

  Future<void> signInUser() async {
    if (!formKey.currentState!.validate()) return;
    // Get.toNamed(AppRoutes.home);
    // return;

    isLoading = true;
    update();

    Map<String, String> body = {
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
    };

    try {
      var response = await ApiService.post(
        ApiEndPoint.signIn,
        body: body,
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        var data = response.data;

        LocalStorage.token = data['data']["accessToken"];

        LocalStorage.myEmail = emailController.text.trim();
        LocalStorage.isLogIn = true;

        LocalStorage.setBool(LocalStorageKeys.isLogIn, LocalStorage.isLogIn);
        LocalStorage.setString(LocalStorageKeys.token, LocalStorage.token);
        LocalStorage.setString(LocalStorageKeys.myEmail, LocalStorage.myEmail);

        // if (LocalStorage.myRole == 'consultant') {
        //   Get.offAllNamed(AppRoutes.doctorHome);
        // } else {
        //   Get.offAllNamed(AppRoutes.patientsHome);
        // }

        emailController.clear();
        passwordController.clear();
        Get.offAllNamed(AppRoutes.home);
      } else {
        Get.snackbar(response.statusCode.toString(), response.message);
      }
    } catch (e) {
      errorLog("error in signin: $e");
    } finally {
      isLoading = false;
      update();
    }
  }
}
