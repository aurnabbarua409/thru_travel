import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_untitled/utils/helpers/other_helper.dart';

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
}
