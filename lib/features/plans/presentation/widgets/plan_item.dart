import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_untitled/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:new_untitled/component/image/common_image.dart';
import 'package:new_untitled/component/text/common_text.dart';
import 'package:new_untitled/features/happening/data/happening_model.dart';
import 'package:new_untitled/utils/constants/app_images.dart';
import 'package:new_untitled/utils/extensions/extension.dart';

import '../../../../utils/constants/app_colors.dart';

class PlanItem extends StatefulWidget {
  const PlanItem({super.key, required this.plan});
  final ActivityModel plan;

  @override
  State<PlanItem> createState() => _PlanItemState();
}

class _PlanItemState extends State<PlanItem> {
  bool isExpanded = false;

  onChange() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          InkWell(
            onTap: onChange,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  CommonImage(
                    imageSrc: widget.plan.images.first,
                    height: 47,
                    width: 100,
                    fill: BoxFit.cover,
                  ),
                  10.width,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: "Activities",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black.withOpacity(0.5),
                        ),
                        CommonText(
                          text: widget.plan.title,
                          fontWeight: FontWeight.w400,
                        ),
                        CommonText(
                          text: widget.plan.date.date3,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (isExpanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(top: 8),
              decoration: BoxDecoration(color: Color(0xffCFE9C3)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 6,
                    children: List.generate(5, (index) {
                      return ClipOval(
                        child: CommonImage(
                          imageSrc:
                              CommonBottomNavBar.profileImage.value ??
                              AppImages.profile,
                          size: 20,
                          fill: BoxFit.cover,
                        ),
                      );
                    }),
                  ),
                  CommonImage(
                    imageSrc: widget.plan.images.first,
                    height: 150,
                    width: Get.width,
                    fill: BoxFit.cover,
                  ),
                  CommonText(
                    text: widget.plan.title,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                    top: 12,
                  ),

                  CommonText(
                    text: widget.plan.address,
                    fontSize: 14,
                    bottom: 2,
                    fontWeight: FontWeight.w400,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    color: AppColors.black.withOpacity(0.5),
                  ),

                  CommonText(
                    text: widget.plan.date.dateTime,
                    fontSize: 14,
                    bottom: 2,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black.withOpacity(0.5),
                  ),

                  // CommonText(
                  //   text: "Est. Time ~ 3 hr 45 min",
                  //   fontSize: 14,
                  //   bottom: 10,
                  //   fontWeight: FontWeight.w400,
                  //   color: AppColors.black.withOpacity(0.5),
                  // ),
                  CommonText(
                    text: widget.plan.description,
                    fontSize: 14,
                    bottom: 10,
                    maxLines: 10,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black.withOpacity(0.5),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
