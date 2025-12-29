import 'package:get/get.dart';
import 'package:new_untitled/config/api/api_end_point.dart';
import 'package:new_untitled/features/friend/data/friend_model.dart';
import 'package:new_untitled/services/api/api_service.dart';

class FriendController extends GetxController {
  final friends = <FriendModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchFriend();
  }

  void fetchFriend() async {
    final response = await ApiService.get(ApiEndPoint.friend);
    if (response.isSuccess) {
      final data = response.data;
      friends.value =
          (data['data'] as List).map((e) => FriendModel.fromJson(e)).toList();
      update();
    }
  }
}
