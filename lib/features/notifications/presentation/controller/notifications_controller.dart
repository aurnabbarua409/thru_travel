import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_untitled/config/api/api_end_point.dart';
import 'package:new_untitled/features/friend/data/friend_model.dart';
import 'package:new_untitled/services/api/api_service.dart';
import 'package:new_untitled/utils/log/error_log.dart';
import '../../data/model/notification_model.dart';
import '../../repository/notification_repository.dart';

class NotificationsController extends GetxController {
  /// Notification List
  // List notifications = [];

  /// Notification Loading Bar
  final isLoading = false.obs;
  final isLoadingFriend = false.obs;

  /// Notification more Data Loading Bar
  bool isLoadingMore = false;

  /// No more notification data
  bool hasNoData = false;

  /// page no here
  int page = 0;

  /// Notification Scroll Controller
  ScrollController scrollController = ScrollController();

  late TabController tabController;

  final notifications = <NotificationModel>[].obs;
  final friends = <FriendModel>[].obs;

  /// Notification More data Loading function

  void moreNotification() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (isLoadingMore || hasNoData) return;
        isLoadingMore = true;
        update();
        page++;
        List<NotificationModel> list = await notificationRepository(page);
        if (list.isEmpty) {
          hasNoData = true;
        } else {
          notifications.addAll(list);
        }
        isLoadingMore = false;
        update();
      }
    });
  }

  /// Notification data Loading function
  getNotificationsRepo() async {
    return;
    // if (isLoading || hasNoData) return;
    // isLoading = true;
    // update();

    // page++;
    // List<NotificationModel> list = await notificationRepository(page);
    // if (list.isEmpty) {
    //   hasNoData = true;
    // } else {
    //   notifications.addAll(list);
    // }
    // isLoading = false;
    // update();
  }

  void fetchNotification() async {
    isLoading.value = true;
    update();

    try {
      final response = await ApiService.get(ApiEndPoint.notifications);
      if (response.isSuccess) {
        final data = response.data;
        notifications.value =
            (data['data']['data'] as List)
                .map((e) => NotificationModel.fromJson(e))
                .toList();
        update();
      }
    } catch (e) {
      errorLog("error in fetching notification: $e");
    } finally {
      isLoading.value = false;
      update();
    }
  }

  void fetchFriend() async {
    try {
      final response = await ApiService.get(ApiEndPoint.friend);
      if (response.isSuccess) {
        final data = response.data;
        friends.value =
            (data['data'] as List).map((e) => FriendModel.fromJson(e)).toList();
        update();
      }
    } catch (e) {
      errorLog("error in fetching friend: $e");
    }
  }

  /// Notification Controller Instance create here
  static NotificationsController get instance =>
      Get.put(NotificationsController());

  /// Controller on Init
  @override
  void onInit() {
    // getNotificationsRepo();
    // moreNotification();
    fetchNotification();
    fetchFriend();
    super.onInit();
  }
}
