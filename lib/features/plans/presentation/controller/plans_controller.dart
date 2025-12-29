import 'dart:convert';

import 'package:get/get.dart';
import 'package:new_untitled/config/api/api_end_point.dart';
import 'package:new_untitled/features/happening/data/happening_model.dart';
import 'package:new_untitled/services/api/api_service.dart';
import 'package:new_untitled/utils/log/app_log.dart';
import 'package:new_untitled/utils/log/error_log.dart';

import '../../../../config/route/app_routes.dart';

class PlansController extends GetxController {
  static PlansController get instance => Get.find<PlansController>();
  final plans = Rxn<HappeningModel>();
  final isLoading = false.obs;
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

  onChangeExperience(String value, String id, String tripName) {
    appLog(value);
    Get.toNamed(
      AppRoutes.addExperience,
      arguments: {"category": value, 'id': id, 'tripName': tripName},
    );
  }

  onChangeTrip(String value) {
    appLog(value);
    Get.toNamed(AppRoutes.plans);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchPlan(Get.arguments);
  }

  void fetchPlan(String id) async {
    isLoading.value = true;
    update();
    try {
      final response = await ApiService.get("${ApiEndPoint.plan}/$id");
      if (response.isSuccess) {
        final data = response.data;
        plans.value = HappeningModel.fromJson(data['data']);
        update();
      }
    } catch (e) {
      errorLog("error in fetch plan: $e");
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
