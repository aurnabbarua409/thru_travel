import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_untitled/component/image/common_image.dart';
import 'package:new_untitled/component/text/common_text.dart';
import 'package:new_untitled/utils/constants/app_images.dart';
import 'package:new_untitled/utils/extensions/extension.dart';

import '../../../../utils/constants/app_colors.dart';

class PlanItem extends StatefulWidget {
  const PlanItem({super.key});

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
                    imageSrc: AppImages.image3,
                    height: 47,
                    width: 100,
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
                          text: "Lake Serene Hike",
                          fontWeight: FontWeight.w400,
                        ),
                        CommonText(
                          text: "September 24, 2025",
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
                      return CommonImage(
                        imageSrc: AppImages.profileIcon,
                        size: 20,
                      );
                    }),
                  ),
                  CommonImage(
                    imageSrc: AppImages.image3,
                    height: 150,
                    width: Get.width,
                  ),
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
                    maxLines: 1,
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
