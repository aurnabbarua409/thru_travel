import 'package:get/get.dart';
import 'package:new_untitled/config/api/api_end_point.dart';
import 'package:new_untitled/features/happening/data/happening_model.dart';
import 'package:new_untitled/services/api/api_service.dart';
import 'package:new_untitled/utils/app_utils.dart';
import 'package:new_untitled/utils/log/error_log.dart';

class HappeningController extends GetxController {
  final happening = <HappeningModel>[].obs;
  final isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchHappening();
  }

  Future onRefresh() async {
    happening.clear();
    fetchHappening();
  }

  void fetchHappening() async {
    isLoading.value = true;
    update();
    try {
      final response = await ApiService.get(ApiEndPoint.happeningNow);
      if (response.isSuccess) {
        final data = response.data;
        final temp = data['data'] as List;
        if (temp.isNotEmpty) {
          happening.value =
              temp.map((e) => HappeningModel.fromJson(e)).toList();
          update();
        }
      }
    } catch (e) {
      errorLog("error in fetching happening: $e");
    } finally {
      isLoading.value = false;
      update();
    }
  }

  void sendComment(String planId, String content) async {
    try {
      final response = await ApiService.post(
        ApiEndPoint.comments,
        body: {"planId": planId, "content": content},
      );
      Utils.snackBar(response.message);
    } catch (e) {
      errorLog("error in sendComment: $e");
    }
  }
}
