import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_untitled/component/image/common_image.dart';
import 'package:new_untitled/features/friend/data/friend_model.dart';
import 'package:new_untitled/utils/constants/app_icons.dart';
import 'package:new_untitled/utils/constants/app_string.dart';
import '../../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../../component/other_widgets/common_loader.dart';
import '../../../../component/other_widgets/no_data.dart';
import '../../../../component/text/common_text.dart';
import '../../../../config/route/app_routes.dart' show AppRoutes;
import '../../../../utils/constants/app_colors.dart';
import '../controller/notifications_controller.dart';
import '../../data/model/notification_model.dart';
import '../widgets/notification_item.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  final controller = NotificationsController.instance;

  @override
  void initState() {
    super.initState();
    controller.tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar Section starts here
      appBar: AppBar(
        backgroundColor: Color(0xffCFE9C3),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: CommonText(
          text: AppString.notifications,
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: AppColors.black.withOpacity(0.7),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.travelLog),
            icon: CommonImage(imageSrc: AppIcons.briefcase),
          ),
        ],
      ),

      /// Body Section starts here
      body: GetBuilder<NotificationsController>(
        builder: (controller) {
          return Column(
            children: [
              // Tab buttons
              Padding(
                padding: EdgeInsets.all(16.w),
                child: TabBar(
                  controller: controller.tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  dividerColor: Colors.transparent,
                  isScrollable: true,
                  unselectedLabelColor: AppColors.black,
                  tabAlignment: TabAlignment.start,
                  splashBorderRadius: BorderRadius.circular(30.r),
                  indicatorPadding: EdgeInsets.symmetric(
                    horizontal: -20,
                    vertical: 6,
                  ),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: Color(0xff2F4630),
                  ),
                  labelStyle: GoogleFonts.inter(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),

                  tabs: [
                    Tab(text: AppString.happening),
                    Tab(text: AppString.messages),
                  ],
                ),
              ),

              // SizedBox(height: 20.h),

              // Content based on selected tab
              Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    Center(
                      child:
                          controller.isLoading.value
                              /// Loading bar here
                              ? const CommonLoader()
                              : controller.notifications.isEmpty
                              ///  data is Empty then show default Data
                              ? const NoData()
                              /// show all Notifications here
                              : ListView.builder(
                                controller: controller.scrollController,
                                // padding: EdgeInsets.symmetric(
                                //   horizontal: 20.sp,
                                //   vertical: 10.sp,
                                // ),
                                itemCount:
                                    controller.isLoadingMore
                                        ? controller.notifications.length + 1
                                        : controller.notifications.length,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  //  Notification More Data Loading Bar
                                  if (index > controller.notifications.length) {
                                    return CommonLoader(
                                      size: 40,
                                      strokeWidth: 2,
                                    );
                                  }
                                  NotificationModel item =
                                      controller.notifications[index];

                                  ///  Notification card item
                                  return GestureDetector(
                                    onTap:
                                        () => controller.markAsRead(
                                          item.id,
                                          index,
                                        ),
                                    child: NotificationItem(
                                      image: item.from.profile,
                                      user: item.from.name,
                                      time: item.createdAt,
                                      message: item.body,
                                      isRead: item.isRead,
                                    ),
                                  );
                                },
                              ),
                    ),
                    Center(
                      child:
                          controller.isLoading.value
                              /// Loading bar here
                              ? const CommonLoader()
                              : controller.friends.isEmpty
                              ///  data is Empty then show default Data
                              ? const NoData()
                              /// show all Notifications here
                              : ListView.builder(
                                controller: controller.scrollController,
                                // padding: EdgeInsets.symmetric(
                                //   horizontal: 20.sp,
                                //   vertical: 10.sp,
                                // ),
                                itemCount:
                                    controller.isLoadingFriend.value
                                        ? controller.friends.length + 1
                                        : controller.friends.length,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  ///  Notification More Data Loading Bar
                                  if (index > controller.friends.length) {
                                    return CommonLoader(
                                      size: 40,
                                      strokeWidth: 2,
                                    );
                                  }
                                  FriendModel item = controller.friends[index];

                                  ///  Notification card item
                                  return NotificationItem(
                                    image: item.image,
                                    user: item.name,
                                    time: item.createdAt,
                                    message: "No message found",
                                    isRead: false,
                                  );
                                },
                              ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },

        // builder: (controller) {
        //   return controller.isLoading
        //       /// Loading bar here
        //       ? const CommonLoader()
        //       : controller.notifications.isEmpty
        //       ///  data is Empty then show default Data
        //       ? const NoData()
        //       /// show all Notifications here
        //       : ListView.builder(
        //         controller: controller.scrollController,
        //         padding: EdgeInsets.symmetric(
        //           horizontal: 20.sp,
        //           vertical: 10.sp,
        //         ),
        //         itemCount:
        //             controller.isLoadingMore
        //                 ? controller.notifications.length + 1
        //                 : controller.notifications.length,
        //         physics: const BouncingScrollPhysics(),
        //         itemBuilder: (context, index) {
        //           ///  Notification More Data Loading Bar
        //           if (index > controller.notifications.length) {
        //             return CommonLoader(size: 40, strokeWidth: 2);
        //           }
        //           NotificationModel item = controller.notifications[index];
        //
        //           ///  Notification card item
        //           return NotificationItem(item: item);
        //         },
        //       );
        // },
      ),

      /// Bottom Navigation Bar Section starts here
      bottomNavigationBar: const CommonBottomNavBar(currentIndex: 0),
    );
  }
}
