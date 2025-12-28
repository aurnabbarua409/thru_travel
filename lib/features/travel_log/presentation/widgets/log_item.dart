import 'package:flutter/cupertino.dart';
import 'package:new_untitled/component/text/common_text.dart';
import 'package:new_untitled/utils/constants/app_colors.dart';
import 'package:new_untitled/utils/constants/app_images.dart';
import 'package:new_untitled/utils/extensions/extension.dart';
import '../../../../component/image/common_image.dart';

Widget logItem(var item) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 13),
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      color: Color(0xff2F4630),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        CommonImage(imageSrc: AppImages.image6, borderRadius: 6),
        6.width,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: "Girls Trip",
                color: AppColors.black,
                fontWeight: FontWeight.w400,
              ),
              CommonText(
                text: "Sept 23 -  September 26, 2025",
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
