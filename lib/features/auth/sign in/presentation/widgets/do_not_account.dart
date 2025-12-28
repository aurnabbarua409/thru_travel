import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../config/route/app_routes.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/constants/app_string.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: AppString.doNotHaveAccount,
            style: GoogleFonts.inter(
              color: AppColors.black,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),

          /// Sign Up Button here
          TextSpan(
            text: AppString.createAnAccount,
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    Get.toNamed(AppRoutes.signUp);
                  },
            style: GoogleFonts.plusJakartaSans(
              color: Color(0xffB7F642),
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
