import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_untitled/component/button/common_button.dart';
import 'package:new_untitled/component/image/common_image.dart';
import 'package:new_untitled/features/plans/presentation/controller/plans_controller.dart';
import 'package:new_untitled/features/trip/data/event_model.dart';
import 'package:new_untitled/features/trip/presentation/controller/trip_controller.dart';
import 'package:new_untitled/features/trip/presentation/widgets/pop_up.dart';
import 'package:new_untitled/utils/constants/app_colors.dart';
import 'package:new_untitled/utils/constants/app_images.dart';
import 'package:new_untitled/utils/extensions/extension.dart';

import '../../../../component/text/common_text.dart';
import '../../../../utils/constants/app_string.dart';

Widget tripDetails(BuildContext context, EventModel event) {
  final controller = Get.put(TripController());
  return SingleChildScrollView(
    child: Container(
      // height: Get.height,
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
          CommonImage(
            imageSrc: AppImages.image3,
            height: 150,
            width: Get.width,
          ),
          CommonText(
            text: event.title,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
            top: 12,
          ),

          CommonText(
            text: event.venue.name,
            fontSize: 14,
            bottom: 2,
            fontWeight: FontWeight.w400,
            color: AppColors.black.withOpacity(0.5),
          ),

          CommonText(
            text: event.address.first,
            fontSize: 14,
            bottom: 2,
            fontWeight: FontWeight.w400,
            color: AppColors.black.withOpacity(0.5),
          ),
          CommonText(
            text: event.address.last,
            fontSize: 14,
            bottom: 2,
            fontWeight: FontWeight.w400,
            color: AppColors.black.withOpacity(0.5),
          ),
          CommonText(
            text: event.date.when,
            fontSize: 14,
            bottom: 10,
            fontWeight: FontWeight.w400,
            color: AppColors.black.withOpacity(0.5),
          ),

          CommonText(
            text: event.description,
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
                (e) => controller.onChangeTrip(e, event),
              );
            },
          ),
          20.height,
        ],
      ),
    ),
  );
}
