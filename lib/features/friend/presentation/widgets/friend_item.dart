import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_untitled/component/button/common_button.dart';
import 'package:new_untitled/component/image/common_image.dart';
import 'package:new_untitled/component/text/common_text.dart';
import 'package:new_untitled/features/friend/presentation/controller/friend_controller.dart';
import 'package:new_untitled/utils/constants/app_colors.dart';
import 'package:new_untitled/utils/constants/app_icons.dart';
import 'package:new_untitled/utils/extensions/extension.dart';

Widget friendItem(FriendController controller, int index) {
  final friend = controller.friends[index];
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Row(
      children: [
        CommonImage(imageSrc: friend.image, borderRadius: 50, size: 48),
        CommonText(text: friend.name, left: 16),
        Spacer(),
        if (controller.planId != "0") ...[
          if (!friend.isInPlan && !friend.isPlanRequestSent)
            CommonButton(
              titleText: "Add to Plans",
              buttonHeight: 32,
              buttonWidth: 120,
              titleSize: 14,
              titleWeight: FontWeight.w500,
              titleColor: AppColors.white,
              buttonColor: AppColors.black,
              borderColor: AppColors.transparent,
              onTap: () => controller.addToPlan(friend.id, index),
            ),

          // if (!friend.isInPlan && friend.isPlanRequestSent)
          //   CommonButton(
          //     titleText: "Requested",
          //     buttonHeight: 32,
          //     buttonWidth: 120,
          //     titleSize: 14,
          //     titleWeight: FontWeight.w500,
          //     titleColor: AppColors.white,
          //     buttonColor: AppColors.black,
          //     borderColor: AppColors.transparent,
          //     onTap: () => controller.addToPlan(friend.id, index),
          //   ),
          if (!friend.isInPlan && friend.isPlanRequestSent)
            InkWell(
              onTap: () => controller.addToPlan(friend.id, index),
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
      ],
    ),
  );
}
