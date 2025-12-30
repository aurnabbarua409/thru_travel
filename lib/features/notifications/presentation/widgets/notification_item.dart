import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_untitled/component/image/common_image.dart';
import 'package:new_untitled/utils/constants/app_images.dart';
import '../../../../component/text/common_text.dart';
import '../../data/model/notification_model.dart';
import '../../../../../utils/extensions/extension.dart';
import '../../../../../utils/constants/app_colors.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.image,
    required this.user,
    required this.time,
    required this.message,
  });

  final String image;
  final String user;
  final DateTime time;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 8.sp),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(8.r),
      //   border: Border.all(color: AppColors.primaryColor),
      // ),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.red,
            ),
          ),
          10.width,
          ClipOval(
            child: CommonImage(
              imageSrc: image,
              width: 50,
              height: 50,
              fill: BoxFit.cover,
            ),
          ),
          10.width,

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  /// Notification Title here
                  CommonText(
                    text: user,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                  ),
                  5.width,

                  /// Notification Time here
                  SizedBox(
                    width: 80,
                    child: CommonText(
                      text: time.timeAgo,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      maxLines: 1,
                      color: AppColors.black,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),

              /// Notification Message here
              SizedBox(
                width: 220,
                child: CommonText(
                  text: message,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  maxLines: 1,
                  color: AppColors.black,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          Spacer(),
          // Expanded(
          //   child: CommonButton(
          //     titleText: "Follow Back",
          //     buttonColor: AppColors.black,
          //   ),
          // ),
          CommonImage(
            imageSrc: AppImages.image1,
            width: 60,
            height: 60,
            fill: BoxFit.cover,
            borderRadius: 10,
          ),
        ],
      ),
    );
  }
}
