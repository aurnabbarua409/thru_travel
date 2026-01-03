import 'package:get/get.dart';
import 'package:new_untitled/config/api/api_end_point.dart';
import 'package:new_untitled/features/home/data/category_model.dart';
import 'package:new_untitled/features/profile/data/profile_model.dart';
import 'package:new_untitled/features/profile/presentation/controller/profile_controller.dart';
import 'package:new_untitled/features/trip/data/event_model.dart';
import 'package:new_untitled/services/api/api_service.dart';
import 'package:new_untitled/services/storage/storage_services.dart';
import 'package:new_untitled/utils/log/error_log.dart';

class HomeController extends GetxController {
  // List<String> categories = [
  //   "Food & Coffee",
  //   "Events",
  //   "Outdoors",
  //   "Food & Coffee",
  //   "Events",
  //   "Outdoors",
  //   "Food & Coffee",
  //   "Events",
  //   "Outdoors",
  //   "Food & Coffee",
  //   "Events",
  //   "Outdoors",
  // ];
  final userName = "".obs;
  final categories = <CategoryModel>[].obs;
  final events = <EventModel>[].obs;

  void setUserName(String name) {
    userName.value = name;
    update();
  }

  void fetchEventByType(String eventType) async {
    try {
      final url = "${ApiEndPoint.event}?eventType=$eventType";
      final response = await ApiService.get(url);
      if (response.isSuccess) {
        final data = response.data['data']['events'] as List;
        if (data.isNotEmpty) {
          events.value = data.map((e) => EventModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      errorLog(e, source: "fetch event by type");
    }
  }

  void fetchCategory() async {
    try {
      final response = await ApiService.get(ApiEndPoint.category);
      if (response.isSuccess) {
        final data = response.data;
        final temp = data['data'] as List;
        if (temp.isNotEmpty) {
          categories.value =
              temp.map((e) => CategoryModel.fromJson(e)).toList();
          update();
        }
      }
    } catch (e) {
      errorLog("error in fetch category: $e");
    }
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    fetchCategory();
    Get.find<ProfileController>();
  }
}
