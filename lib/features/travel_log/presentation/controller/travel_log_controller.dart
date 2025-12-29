import 'package:get/get.dart';
import 'package:new_untitled/config/api/api_end_point.dart';
import 'package:new_untitled/features/travel_log/data/travel_log_model.dart';
import 'package:new_untitled/services/api/api_service.dart';
import 'package:new_untitled/utils/log/error_log.dart';

class TravelLogController extends GetxController {
  final logs = [
    {"title": "Login", "year": 2025},
    {"title": "Logout", "year": 2025},
    {"title": "Signup", "year": 2025},
    {"title": "Payment", "year": 2024},
    {"title": "Payment", "year": 2024},
  ];
  final travelLogs = <TravelLogModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchTravelLog();
  }

  void fetchTravelLog() async {
    isLoading.value = true;
    update();
    try {
      final response = await ApiService.get(ApiEndPoint.travelLog);
      if (response.isSuccess) {
        final data = response.data;
        travelLogs.value =
            (data['data'] as List)
                .map((e) => TravelLogModel.fromJson(e))
                .toList();
        update();
      }
    } catch (e) {
      errorLog("error in fetching travel log: $e");
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Map<int, List<TravelLogModel>> get groupedLogs {
    final Map<int, List<TravelLogModel>> grouped = {};

    for (var log in travelLogs) {
      final year = log.date.year;
      grouped.putIfAbsent(year, () => []);
      grouped[year]!.add(log);
    }

    return grouped;
  }
}
