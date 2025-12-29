import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_untitled/component/button/common_button.dart';
import 'package:new_untitled/utils/constants/app_colors.dart';
import 'package:new_untitled/utils/constants/app_string.dart';
import 'package:new_untitled/utils/extensions/extension.dart';

import '../../../../component/text/common_text.dart';
import '../../../trip/presentation/widgets/pop_up.dart';
import '../controller/plans_controller.dart';
import '../widgets/plan_item.dart';
import '../widgets/plans_appbar.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    PopupController().hide();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlansController>(
      builder:
          (controller) => Scaffold(
            appBar: plansAppBar(context, controller),
            body:
                controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                      children: [
                        Container(
                          height: 42.h,
                          width: Get.width,
                          decoration: BoxDecoration(color: Color(0xffCFE9C3)),
                          child:
                              CommonText(
                                text:
                                    "Trip Name:  “${controller.plans.value!.title}",
                                color: AppColors.black,
                              ).center,
                        ),
                        Container(
                          height: 42.h,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Color(0xffF4F2EC),
                            border: Border.all(
                              color: Color(0xffE6E6E6),
                              width: 0.5,
                            ),
                          ),
                          child:
                              CommonText(
                                text:
                                    "Dates: ${controller.plans.value!.date.date2} - ${controller.plans.value!.activities.last.date.date2}",
                                color: AppColors.black,
                              ).center,
                        ),
                        Expanded(
                          child:
                              controller.plans.value!.activities.isEmpty
                                  ? Center(
                                    child: CommonText(text: "No plan found"),
                                  )
                                  : ListView.builder(
                                    itemCount:
                                        controller
                                            .plans
                                            .value!
                                            .activities
                                            .length,
                                    itemBuilder: (context, index) {
                                      return PlanItem(
                                        plan:
                                            controller
                                                .plans
                                                .value!
                                                .activities[index],
                                      );
                                    },
                                  ),
                        ),
                      ],
                    ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 34),
              child: CommonButton(titleText: AppString.seeYouSoon),
            ),
          ),
    );
  }
}
