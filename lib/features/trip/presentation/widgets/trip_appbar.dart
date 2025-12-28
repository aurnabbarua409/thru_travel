import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_untitled/component/image/common_image.dart';
import 'package:new_untitled/utils/constants/app_colors.dart';
import 'package:new_untitled/utils/constants/app_icons.dart';
import 'package:new_untitled/utils/extensions/extension.dart';

import '../../../../component/text/common_text.dart';

AppBar tripProfileAppBar() {
  return AppBar(
    backgroundColor: AppColors.white,
    automaticallyImplyLeading: false,
    title: Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          CommonImage(imageSrc: AppIcons.search, size: 24),
          10.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: "Seattle",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                CommonText(
                  text: "Sep 12 – 15",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff828282),
                ),
              ],
            ),
          ),
          CommonImage(imageSrc: AppIcons.edit, size: 24),
        ],
      ),
    ),
  );
}
