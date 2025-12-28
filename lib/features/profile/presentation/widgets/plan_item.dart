import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_untitled/component/image/common_image.dart';
import 'package:new_untitled/utils/constants/app_colors.dart';
import 'package:new_untitled/utils/constants/app_images.dart';

import '../../../../component/text/common_text.dart';

Widget planItem() {
  return Container(
    padding: EdgeInsets.only(right: 12.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonImage(imageSrc: AppImages.image2, size: 148, fill: BoxFit.fill),
        CommonText(
          text: "Gold Bar Friends Trip",
          color: AppColors.black.withOpacity(0.5),
          fontSize: 12,
          top: 12,
          fontWeight: FontWeight.w400,
        ),
        CommonText(
          text: "Sept 23 - Sept 26",
          color: AppColors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ],
    ),
  );
}
