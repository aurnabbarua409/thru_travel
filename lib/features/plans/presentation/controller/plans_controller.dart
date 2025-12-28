import 'package:get/get.dart';
import 'package:new_untitled/utils/log/app_log.dart';

import '../../../../config/route/app_routes.dart';

class PlansController extends GetxController {
  static PlansController get instance => Get.find<PlansController>();

  final List<String> trips = [
    'Add to New Trip',
    'Add to Girls Trip',
    'Add to Friends giving',
    'Add to Family Vacation',
    'Add to Japan 2025',
    'Add to Lazy Saturday',
    'Add to Girls Trip',
  ];

  final List<String> experience = [
    'ADD TO STAYS',
    'FOOD & COFFEE',
    'OUTDOORS',
    'NIGHTLIFE',
    'DATENIGHT',
  ];

  onChangeExperience(String value) {
    appLog(value);
    Get.toNamed(AppRoutes.addExperience, parameters: {"value": value});
  }

  onChangeTrip(String value) {
    appLog(value);
    Get.toNamed(AppRoutes.plans);
  }
}
