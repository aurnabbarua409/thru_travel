import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_untitled/component/button/common_button.dart';
import 'package:new_untitled/component/image/common_image.dart';
import 'package:new_untitled/utils/constants/app_colors.dart';
import 'package:new_untitled/utils/constants/app_icons.dart';
import 'package:new_untitled/utils/constants/app_images.dart';
import 'package:new_untitled/utils/extensions/extension.dart';

import '../../../../component/text/common_text.dart';
import '../../../../utils/constants/app_string.dart';
import '../controller/trip_controller.dart';

Widget tripItem() {
  return Column(
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
      Row(
        children: [
          CommonImage(imageSrc: AppIcons.star),
          CommonText(
            text: "4.5 (500 ${AppString.reviews})",
            fontWeight: FontWeight.w400,
            color: AppColors.black.withOpacity(0.5),
          ),
          CommonImage(imageSrc: AppIcons.map),
          CommonText(
            text: "48.6  ${AppString.miles}",
            color: AppColors.black.withOpacity(0.5),
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
      8.height,
      CommonButton(
        titleText: AppString.save,
        buttonHeight: 28,
        buttonWidth: 142,
        buttonColor: Color(0xff2F4630),
        borderColor: AppColors.transparent,
        titleSize: 14,
        titleWeight: FontWeight.w400,
        onTap: TripController.instance.onChangeDetails,
      ),
      20.height,
    ],
  );
}
