import 'package:get/get.dart';
import 'package:new_untitled/config/api/api_end_point.dart';
import 'package:new_untitled/features/friend/data/friend_model.dart';
import 'package:new_untitled/services/api/api_service.dart';
import 'package:new_untitled/utils/app_utils.dart';
import 'package:new_untitled/utils/log/error_log.dart';

class FriendController extends GetxController {
  final friends = <FriendModel>[].obs;
  String planId = "";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    planId = Get.parameters['planId'] ?? "0";
    fetchFriend();
  }

  void fetchFriend() async {
    try {
      final url =
          planId == "0"
              ? ApiEndPoint.friend
              : "${ApiEndPoint.friend}?planId=$planId";
      final response = await ApiService.get(url);
      if (response.isSuccess) {
        final data = response.data;
        friends.value =
            (data['data'] as List).map((e) => FriendModel.fromJson(e)).toList();
        update();
      }
    } catch (e) {
      errorLog("error in fetch friend: $e");
    }
  }

  void addToPlan(String requestTo, int index) async {
    if (planId == "0") return;
    final body = {"requestedTo": requestTo, "planId": planId};
    try {
      final response = await ApiService.post(
        ApiEndPoint.requestPlanAdd,
        body: body,
      );
      if (response.isSuccess) {
        friends[index].isInPlan = true;
        update();
        Utils.snackBar(response.message);
      } else {
        Utils.snackBar(response.message);
      }
    } catch (e) {
      errorLog("error in requesting plan: $e");
    }
  }
}
