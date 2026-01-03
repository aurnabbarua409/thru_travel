import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_untitled/component/button/common_button.dart';
import 'package:new_untitled/component/image/common_image.dart';
import 'package:new_untitled/features/trip/data/event_model.dart';
import 'package:new_untitled/utils/constants/app_colors.dart';
import 'package:new_untitled/utils/extensions/extension.dart';

import '../../../../component/text/common_text.dart';
import '../../../../config/route/app_routes.dart';

Widget plansItem(EventModel event) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CommonImage(
        imageSrc: event.thumbnail,
        height: 150,
        width: Get.width,
        fill: BoxFit.cover,
      ),
      CommonText(
        text: event.title,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
        top: 12,
      ),
      CommonText(
        text: "Venue: ${event.venue.name}",
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        color: AppColors.black.withOpacity(0.5),
      ),
      CommonText(
        text: event.date.when,
        fontWeight: FontWeight.w400,

        color: AppColors.black.withOpacity(0.5),
      ),
      8.height,
      CommonButton(
        titleText: "See More",
        buttonHeight: 28,
        buttonWidth: 142,
        buttonColor: Color(0xff2F4630),
        borderColor: AppColors.transparent,
        titleSize: 14,
        titleWeight: FontWeight.w400,
        onTap: () {
          Get.toNamed(AppRoutes.planDetails);
        },
      ),
      20.height,
    ],
  );
}
