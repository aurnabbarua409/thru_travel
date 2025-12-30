import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_untitled/component/image/common_image.dart';
import 'package:new_untitled/component/text/common_text.dart';
import 'package:new_untitled/features/plans/presentation/controller/plans_controller.dart';
import 'package:new_untitled/utils/constants/app_icons.dart';
import 'package:new_untitled/utils/constants/app_string.dart';

import '../../../../config/route/app_routes.dart';
import '../../../trip/presentation/widgets/pop_up.dart';

AppBar plansAppBar(BuildContext context, PlansController controller) {
  return AppBar(
    title: CommonText(
      text: AppString.plans,
      fontSize: 17,
      fontWeight: FontWeight.w700,
    ),
    actions: [
      InkWell(
        onTap: () {
          PopupController().showAdd(
            context,
            top: 100,
            right: 30,
            list: controller.experience,
            onTap:
                (e) => controller.onChangeExperience(
                  e,
                  controller.plans.value!.id,
                  controller.plans.value!.title,
                ),
          );
        },
        child: CommonImage(imageSrc: AppIcons.add),
      ),
      IconButton(
        onPressed:
            () => Get.toNamed(
              AppRoutes.friend,
              parameters: {'planId': controller.plans.value!.id},
            ),
        icon: CommonImage(imageSrc: AppIcons.groups),
      ),
    ],
  );
}
