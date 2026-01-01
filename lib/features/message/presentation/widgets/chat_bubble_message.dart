import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_untitled/utils/extensions/extension.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_images.dart';
import '../../../../component/image/common_image.dart';
import '../../../../component/text/common_text.dart';

class ChatBubbleMessage extends StatelessWidget {
  final DateTime time;
  final String text;
  final String image;
  final bool isMe;
  final int index;
  final int messageIndex;

  final VoidCallback onTap;

  const ChatBubbleMessage({
    super.key,
    required this.time,
    required this.text,
    required this.image,
    required this.isMe,
    required this.onTap,
    this.index = 0,
    this.messageIndex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            // margin: EdgeInsets.only(left: 10.w),
            // padding: EdgeInsets.only(left: 10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.transparent,
            ),
            child: Row(
              children: [
                /// participant Image here
                if (!isMe)
                  ClipOval(
                    child: CommonImage(
                      imageSrc: image,
                      fill: BoxFit.cover,
                      size: 50,
                    ),
                  ),
                5.width,

                ///Message here
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  constraints: BoxConstraints(maxWidth: 220),
                  decoration: BoxDecoration(
                    color: isMe ? AppColors.primaryColor : AppColors.secondary,
                    borderRadius: BorderRadius.circular(18.r),
                  ),

                  child: Text(
                    text,
                    style: TextStyle(color: AppColors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
