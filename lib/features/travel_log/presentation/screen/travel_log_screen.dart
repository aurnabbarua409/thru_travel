import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_untitled/component/text/common_text.dart';
import 'package:new_untitled/utils/constants/app_string.dart';
import 'package:new_untitled/utils/extensions/extension.dart';

import '../controller/travel_log_controller.dart';
import '../widgets/log_item.dart';

class TravelLogScreen extends StatelessWidget {
  const TravelLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCFE9C3),
      appBar: AppBar(
        title: CommonText(
          text: AppString.travelLog,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      body: GetBuilder<TravelLogController>(
        builder: (controller) {
          return ListView.builder(
            padding: EdgeInsets.all(16.sp),
            physics: const BouncingScrollPhysics(),
            itemCount: controller.groupedLogs.keys.length,
            itemBuilder: (context, index) {
              final years =
                  controller.groupedLogs.keys.toList()
                    ..sort((a, b) => b.compareTo(a));
              final year = years[index];
              final logsForYear = controller.groupedLogs[year]!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: year.toString(),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ).center,

                  SizedBox(height: 8),
                  ...logsForYear.map((log) => logItem(log)),
                  SizedBox(height: 16),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
