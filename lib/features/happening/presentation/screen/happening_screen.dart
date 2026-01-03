import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../../component/image/common_image.dart';
import '../../../../component/text/common_text.dart';
import '../../../../config/route/app_routes.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_icons.dart';
import '../../../../utils/constants/app_string.dart';
import '../controller/happening_controller.dart';
import '../widgets/post_item.dart';

class HappeningScreen extends StatelessWidget {
  const HappeningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffCFE9C3),

          automaticallyImplyLeading: false,
          centerTitle: true,
          title: CommonText(
            text: AppString.happening,
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
        body: GetBuilder<HappeningController>(
          builder: (controller) {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator.adaptive());
            }
            if (controller.happening.isEmpty) {
              return Center(child: Text("Nothing is happening now"));
            }
            return ListView.builder(
              padding: EdgeInsets.all(16.sp),
              physics: const BouncingScrollPhysics(),
              itemCount: controller.happening.length,
              itemBuilder: (context, index) {
                return PostItem(
                  happening: controller.happening[index],
                  onSendComment:
                      (id, content) => controller.sendComment(id, content),
                );
              },
            );
          },
        ),
        bottomNavigationBar: const CommonBottomNavBar(currentIndex: 3),
      ),
    );
  }
}
