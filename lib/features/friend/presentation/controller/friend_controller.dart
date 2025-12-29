import 'package:get/get.dart';
import 'package:new_untitled/config/api/api_end_point.dart';
import 'package:new_untitled/features/friend/data/friend_model.dart';
import 'package:new_untitled/services/api/api_service.dart';
import 'package:new_untitled/utils/log/error_log.dart';

class FriendController extends GetxController {
  final friends = <FriendModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchFriend();
  }

  void fetchFriend() async {
    try {
      final response = await ApiService.get(ApiEndPoint.request);
      if (response.isSuccess) {
        final data = response.data;
        friends.value =
            (data['data']['data'] as List)
                .map((e) => FriendModel.fromJson(e))
                .toList();
        update();
      }
    } catch (e) {
      errorLog("error in fetch friend: $e");
    }
  }
}
