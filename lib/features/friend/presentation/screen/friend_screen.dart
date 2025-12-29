import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_untitled/component/bottom_nav_bar/common_bottom_bar.dart';

import '../../../../component/text/common_text.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_string.dart';
import '../controller/friend_controller.dart';
import '../widgets/friend_item.dart';

class FriendScreen extends StatelessWidget {
  FriendScreen({super.key});

  final String value = Get.parameters["value"] ?? "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffCFE9C3),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light, // iOS
        ),
        centerTitle: true,
        title: CommonText(
          text: AppString.friends,
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: AppColors.black.withOpacity(0.7),
        ),
      ),
      body: GetBuilder<FriendController>(
        builder: (controller) {
          return controller.friends.isEmpty
              ? Center(child: CommonText(text: "You don't have any friend"))
              : ListView.builder(
                itemCount: controller.friends.length,
                padding: EdgeInsets.all(16.sp),
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return friendItem(friend: controller.friends[index]);
                },
              );
        },
      ),

      bottomNavigationBar: CommonBottomNavBar(currentIndex: 9),
    );
  }
}
