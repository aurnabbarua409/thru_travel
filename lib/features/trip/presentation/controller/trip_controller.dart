import 'package:get/get.dart';
import 'package:new_untitled/utils/log/app_log.dart';

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

  String selectedFilter = "";
  String selectedSort = "";

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
}
