import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_untitled/component/text/common_text.dart';
import 'package:new_untitled/features/home/presentation/controller/home_controller.dart';

import '../../../../component/bottom_nav_bar/common_bottom_bar.dart';
import '../widgets/plan_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final _controller = Get.find<HomeController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.fetchEventByType(Get.arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        if (_controller.eventLoading.value) {
          return Center(child: CircularProgressIndicator.adaptive());
        }
        if (_controller.events.isEmpty) {
          return Center(child: CommonText(text: "No item found"));
        }

        return ListView.builder(
          itemCount: 10,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemBuilder: (context, index) {
            final item = _controller.events[index];
            return plansItem(item);
          },
        );
      }),
      bottomNavigationBar: CommonBottomNavBar(currentIndex: 9),
    );
  }
}
