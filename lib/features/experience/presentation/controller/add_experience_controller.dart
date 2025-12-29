import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_untitled/config/api/api_end_point.dart';
import 'package:new_untitled/services/api/api_service.dart';
import 'package:new_untitled/utils/app_utils.dart';
import 'package:new_untitled/utils/helpers/other_helper.dart';
import 'package:new_untitled/utils/log/error_log.dart';

class AddExperienceController extends GetxController {
  String? image;

  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController linkController = TextEditingController();

  getProfileImage() async {
    image = await OtherHelper.openGallery();
    update();
  }

  String id = "";
  String tripName = "";
  String category = "";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final args = Get.arguments;
    id = args['id'];
    tripName = args['tripName'];
    category = args['category'];
  }

  void addExperience() async {
    final body = {
      "planId": id,
      "title": titleController.text.trim(),
      "externalId": "",
      "address": locationController.text.trim(),
      "date": DateTime.parse(dateController.text.trim()).toIso8601String(),
      "images": [image],
      "link": linkController.text.trim(),
    };
    try {
      final response = await ApiService.post(
        ApiEndPoint.addNewPlan,
        body: body,
      );
      if (response.isSuccess) {
        // Utils.successSnackBar("Success", response.message);
        Get.back();
      }
    } catch (e) {
      errorLog("error in adding experience: $e");
    }
  }
}
