import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_untitled/component/text/common_text.dart';
import 'package:new_untitled/utils/constants/app_colors.dart';
import 'package:new_untitled/utils/extensions/extension.dart';

import '../../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../../../../component/image/common_image.dart';
import '../../../../config/route/app_routes.dart';
import '../../../../utils/constants/app_images.dart';
import '../controller/home_controller.dart';
import '../widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F2EC),
      appBar: homeAppbar(),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                CommonText(
                  text: "Your Daily Picks",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black.withOpacity(0.5),
                  left: 24,
                  top: 20,
                  bottom: 13,
                ).start,

                Container(
                  height: 381.h,
                  decoration: BoxDecoration(color: Color(0xffCFE9C3)),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    itemCount: controller.categories.length,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var item = controller.categories[index];
                      return InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.category);
                        },
                        child: InkWell(
                          onTap: () => Get.toNamed(AppRoutes.experienceDetails),
                          child: CommonImage(
                            imageSrc: AppImages.image7,
                            height: 380.w,
                            borderRadius: 8,
                          ),
                        ),
                      );
                    },
                    //     ),
                  ),
                ),
                Container(
                  height: 210.h,
                  decoration: BoxDecoration(color: Color(0xffCFE9C3)),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    itemCount: controller.categories.length,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var item = controller.categories[index];
                      return InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.category);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Column(
                            children: [
                              6.height,
                              CommonImage(
                                imageSrc: AppImages.image7,
                                height: 173,
                                width: (Get.width - 30) / 3,
                                borderRadius: 8,
                                fill: BoxFit.fitHeight,
                              ),

                              CommonText(
                                text: item,
                                fontWeight: FontWeight.w400,
                                bottom: 10,
                                color: AppColors.black,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: CommonBottomNavBar(currentIndex: 2),
    );
  }
}
