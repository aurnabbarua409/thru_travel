import 'package:get/get.dart';
import 'package:new_untitled/config/api/api_end_point.dart';
import 'package:new_untitled/config/route/app_routes.dart';
import 'package:new_untitled/features/trip/data/event_model.dart';
import 'package:new_untitled/services/api/api_service.dart';
import 'package:new_untitled/utils/app_utils.dart';
import 'package:new_untitled/utils/log/app_log.dart';
import 'package:new_untitled/utils/log/error_log.dart';

class TripController extends GetxController {
  static TripController instance = Get.find<TripController>();

  bool isDetails = false;

  List<String> filters = [
    "Food and Coffee",
    "Outdoors",
    "Nightlife",
    "Culture",
    "Date Night",
  ];
  List<String> sorts = [
    "Proximity ",
    "Highest Rated",
    "Friend Picks",
    "Trending",
  ];

  final List<String> trips = [
    'Add to New Trip',
    'Add to Girls Trip',
    'Add to Friends giving',
    'Add to Family Vacation',
    'Add to Japan 2025',
    'Add to Lazy Saturday',
    'Add to Girls Trip',
  ];

  final events = <EventModel>[].obs;

  String selectedFilter = "";
  String selectedSort = "";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchEvents();
  }

  onChangeFilter(int index) {
    selectedFilter = filters[index];
    appLog(selectedFilter);
    update();
  }

  onChangeSort(int index) {
    selectedSort = sorts[index];
    appLog(selectedSort);
    update();
  }

  onChangeDetails() {
    isDetails = !isDetails;
    update();
  }

  void fetchEvents() async {
    try {
      final response = await ApiService.get(ApiEndPoint.event);
      if (response.isSuccess) {
        final data = response.data;
        events.value =
            (data['data']['events'] as List)
                .map((e) => EventModel.fromJson(e))
                .toList();
        update();
      } else {
        Utils.snackBar(response.message);
      }
    } catch (e) {
      errorLog("error in fetching event: $e");
    }
  }

  Future<String?> createNewTrip(EventModel event) async {
    final body = {
      "title": event.title,
      "externalId": event.id,
      "description": event.description,
      "address": "${event.address.first} ${event.address.last}",
      "date": event.createdAt.toIso8601String(),
      "images": [event.thumbnail],
    };
    try {
      final response = await ApiService.post(
        ApiEndPoint.newPlanActivity,
        body: body,
      );
      if (response.isSuccess) {
        Utils.snackBar(response.message);
        final data = response.data;
        return data['data']['plan']['_id'].toString();
      } else {
        Utils.snackBar(response.message);
      }
      return null;
    } catch (e) {
      errorLog("error in create new trip: $e");
      return null;
    }
  }

  void onChangeTrip(String value, EventModel event) async {
    String id = "";
    if (value == trips.first) {
      id = await createNewTrip(event) ?? "";
    }
    appLog("event id for ${event.title}: ${id}");
    Get.toNamed(AppRoutes.plans, arguments: id);
  }
}
