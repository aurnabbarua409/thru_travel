import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_untitled/component/button/common_button.dart';
import 'package:new_untitled/component/image/common_image.dart';
import 'package:new_untitled/features/plans/presentation/controller/plans_controller.dart';
import 'package:new_untitled/features/trip/presentation/widgets/pop_up.dart';
import 'package:new_untitled/utils/constants/app_colors.dart';
import 'package:new_untitled/utils/constants/app_images.dart';
import 'package:new_untitled/utils/extensions/extension.dart';

import '../../../../component/text/common_text.dart';
import '../../../../utils/constants/app_string.dart';

Widget tripDetails(BuildContext context) {
  final controller = PlansController.instance;
  return Container(
    height: Get.height,
    width: Get.width,
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Color(0xffCFE9C3),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.r),
        topRight: Radius.circular(24.r),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonImage(imageSrc: AppImages.image3, height: 150, width: Get.width),
        CommonText(
          text: "Lake Serene Trail",
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
          top: 12,
        ),

        CommonText(
          text: "Mount Index State Park Index, WA",
          fontSize: 14,
          bottom: 2,
          fontWeight: FontWeight.w400,
          color: AppColors.black.withOpacity(0.5),
        ),

        CommonText(
          text: "Moderate - 7.2 mi - Out & Back",
          fontSize: 14,
          bottom: 2,
          fontWeight: FontWeight.w400,
          color: AppColors.black.withOpacity(0.5),
        ),
        CommonText(
          text: "Est. Time ~ 3 hr 45 min",
          fontSize: 14,
          bottom: 10,
          fontWeight: FontWeight.w400,
          color: AppColors.black.withOpacity(0.5),
        ),

        CommonText(
          text:
              "Tucked into the Cascade foothills, Lake Serene Trail is the definition of a payoff hike. The path winds through mossy forest, crosses a roaring waterfall halfway up, and ends at a mirror-blue alpine lake beneath steep granite cliffs. ",
          fontSize: 14,
          bottom: 10,
          maxLines: 5,
          textAlign: TextAlign.start,
          fontWeight: FontWeight.w400,
          color: AppColors.black.withOpacity(0.5),
        ),
        CommonButton(
          titleText: AppString.addToTrip,
          buttonHeight: 28,
          buttonWidth: 142,
          buttonColor: Color(0xff2F4630),
          borderColor: AppColors.transparent,
          titleSize: 14,
          titleWeight: FontWeight.w400,
          onTap: () {
            PopupController().show(
              context,
              const Offset(20, 80),
              controller.trips,
              controller.onChangeTrip,
            );
          },
        ),
        20.height,
      ],
    ),
  );
}
