import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_untitled/component/text/common_text.dart';
import 'package:new_untitled/features/profile/data/plan_model.dart';
import 'package:new_untitled/features/profile/presentation/widgets/plan_item.dart';
import 'package:new_untitled/utils/constants/app_string.dart';
import 'package:new_untitled/utils/extensions/extension.dart';

import '../../../../config/route/app_routes.dart';

Widget plans(List<PlanModel> plans) {
  return Container(
    decoration: BoxDecoration(color: Color(0xffCFE9C3)),
    child: Column(
      children: [
        12.height,
        Row(
          children: [
            CommonText(
              text: AppString.plans,
              fontSize: 16,
              left: 12,
              right: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            Container(
              height: 20.sp,
              width: 20.sp,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.arrow_forward_ios, size: 14),
            ),
          ],
        ),

        12.height,
        plans.isEmpty
            ? SizedBox(
              height: 215.h,
              child: Center(child: Text("No plan found")),
            )
            : SizedBox(
              height: 215.h,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 12),
                scrollDirection: Axis.horizontal,
                itemCount: plans.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Get.toNamed(AppRoutes.plans),
                    child: planItem(plans[index]),
                  );
                },
              ),
            ),
      ],
    ),
  );
}
