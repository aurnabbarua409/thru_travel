import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_untitled/component/button/common_button.dart';
import 'package:new_untitled/component/image/common_image.dart';
import 'package:new_untitled/component/text/common_text.dart';
import 'package:new_untitled/utils/constants/app_colors.dart';
import 'package:new_untitled/utils/constants/app_icons.dart';
import 'package:new_untitled/utils/constants/app_images.dart';
import 'package:new_untitled/utils/extensions/extension.dart';

import '../../../../config/route/app_routes.dart';

Widget friendItem({String value = ""}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Row(
      children: [
        CommonImage(imageSrc: AppImages.image4, borderRadius: 50, size: 48),
        CommonText(text: "starryskies23", left: 16),
        Spacer(),
        if (value.toLowerCase() == "add")
          CommonButton(
            titleText: "Add to Plans",
            buttonHeight: 32,
            buttonWidth: 90,
            titleSize: 14,
            titleWeight: FontWeight.w500,
            titleColor: AppColors.white,
            buttonColor: AppColors.black,
            borderColor: AppColors.transparent,
            onTap:
                () => Get.toNamed(
                  AppRoutes.friend,
                  parameters: {"value": "remove"},
                ),
          ),

        if (value.toLowerCase() == "remove")
          InkWell(
            onTap: () => Get.toNamed(AppRoutes.friend),
            child: Container(
              width: 90.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(8.r),
              ),

              child: CommonImage(imageSrc: AppIcons.clear, size: 20).center,
            ),
          ),
      ],
    ),
  );
}
