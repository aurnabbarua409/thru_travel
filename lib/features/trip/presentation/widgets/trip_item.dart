import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_untitled/component/button/common_button.dart';
import 'package:new_untitled/component/image/common_image.dart';
import 'package:new_untitled/features/trip/data/event_model.dart';
import 'package:new_untitled/features/trip/presentation/widgets/trip_details.dart';
import 'package:new_untitled/utils/constants/app_colors.dart';
import 'package:new_untitled/utils/extensions/extension.dart';

import '../../../../component/text/common_text.dart';

Widget tripItem(BuildContext context, EventModel event) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CommonImage(imageSrc: event.thumbnail, height: 150, width: Get.width),
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
      // Row(
      //   children: [
      //     CommonImage(imageSrc: AppIcons.star),
      //     CommonText(
      //       text: "4.5 (500 ${AppString.reviews})",
      //       fontWeight: FontWeight.w400,
      //       color: AppColors.black.withOpacity(0.5),
      //     ),
      //     CommonImage(imageSrc: AppIcons.map),
      //     CommonText(
      //       text: "48.6  ${AppString.miles}",
      //       color: AppColors.black.withOpacity(0.5),
      //       fontWeight: FontWeight.w400,
      //     ),
      //   ],
      // ),
      8.height,
      CommonButton(
        titleText: "See more",
        buttonHeight: 28,
        buttonWidth: 142,
        buttonColor: Color(0xff2F4630),
        borderColor: AppColors.transparent,
        titleSize: 14,
        titleWeight: FontWeight.w400,
        onTap:
            () => showModalBottomSheet(
              context: context,
              builder: (context) => tripDetails(context, event),
            ),
        // onTap: TripController.instance.onChangeDetails,
      ),
      20.height,
    ],
  );
}
