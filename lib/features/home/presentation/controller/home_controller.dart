import 'package:get/get.dart';
import 'package:new_untitled/features/profile/data/profile_model.dart';
import 'package:new_untitled/features/profile/presentation/controller/profile_controller.dart';
import 'package:new_untitled/services/storage/storage_services.dart';

class HomeController extends GetxController {
  List<String> categories = [
    "Food & Coffee",
    "Events",
    "Outdoors",
    "Food & Coffee",
    "Events",
    "Outdoors",
    "Food & Coffee",
    "Events",
    "Outdoors",
    "Food & Coffee",
    "Events",
    "Outdoors",
  ];
  final userName = "".obs;

  void setUserName(String name) {
    userName.value = name;
    update();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    Get.find<ProfileController>();
  }
}
