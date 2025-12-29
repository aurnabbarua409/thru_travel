import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_untitled/component/button/common_button.dart';
import 'package:new_untitled/features/experience/presentation/controller/add_experience_controller.dart';
import 'package:new_untitled/utils/constants/app_string.dart';
import 'package:new_untitled/utils/extensions/extension.dart';

import '../../../../component/text/common_text.dart';
import '../../../../utils/constants/app_colors.dart';
import '../widgets/experience_all_field.dart';
import '../widgets/experience_appbar.dart';
import '../widgets/image.dart';

class AddExperienceScreen extends StatelessWidget {
  const AddExperienceScreen({super.key});

  // final String value = Get.parameters["value"] ?? "";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddExperienceController>(
      builder:
          (controller) => Scaffold(
            appBar: experienceAppBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 42.h,
                    width: Get.width,
                    decoration: BoxDecoration(color: Color(0xffCFE9C3)),
                    child:
                        CommonText(
                          text: "Trip Name:  “${controller.tripName}",
                          color: AppColors.black,
                        ).center,
                  ),
                  Container(
                    height: 42.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Color(0xffF4F2EC),
                      border: Border.all(color: Color(0xffE6E6E6), width: 0.5),
                    ),
                    child:
                        CommonText(
                          text: controller.category,
                          color: AppColors.black,
                          left: 20,
                        ).start,
                  ),
                  24.height,
                  experienceImage(controller),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.sp),
                    child: ExperienceAllField(controller: controller),
                  ),

                  30.height,
                ],
              ),
            ),

            bottomNavigationBar: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ).copyWith(bottom: 28.h),
              child: CommonButton(
                titleText: AppString.thru,
                onTap: controller.addExperience,
              ),
            ),
          ),
    );
  }
}
