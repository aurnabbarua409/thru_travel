import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_untitled/features/home/presentation/widgets/map_scetion.dart';

import '../../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../controller/home_controller.dart';
import '../widgets/plan_details.dart';

class PlanDetailsScreen extends StatelessWidget {
  const PlanDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return Stack(
            children: [
              mapSection(controller),
              Positioned(
                top: 200,
                left: 0,
                right: 0,
                child: planDetails(context),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: CommonBottomNavBar(currentIndex: 9),
    );
  }
}
