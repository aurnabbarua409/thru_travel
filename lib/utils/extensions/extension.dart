import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as screenutil;
import 'package:intl/intl.dart';
import 'package:new_untitled/utils/log/error_log.dart';

extension View on num {
  Widget get height => SizedBox(height: toDouble().h);

  Widget get width => SizedBox(width: toDouble().w);
}

// All Alignments Extensions

extension Alignments on Widget {
  Widget get start => Align(alignment: Alignment.centerLeft, child: this);

  Widget get end => Align(alignment: Alignment.centerRight, child: this);

  Widget get center => Align(alignment: Alignment.center, child: this);
}

// All Alignments Time Formatter Extensions
extension TimeFormater on DateTime {
  String get time => DateFormat('h:mm a').format(this);

  String get date => DateFormat('dd-MM-yyyy').format(this);
  String get date2 => DateFormat('dd/MM/yyyy').format(this);
  String get date3 => DateFormat('MMMM dd, yyyy').format(this);
  String get monthDay => DateFormat('MMMM dd').format(this);
  String get dateTime => "$date3 at $time";
  String get dayName => DateFormat('E').format(this);

  String get MonthName => DateFormat.MMMM().format(this);

  String get MonthNameShort => DateFormat.MMM().format(this);

  String get checkTime {
    DateTime currentDateTime = DateTime.now();

    Duration difference = currentDateTime.difference(this);
    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        return ("${difference.inMinutes} minutes ago");
      } else {
        return ("${difference.inHours} hours ago");
      }
    } else {
      var createdAtTime = toIso8601String().split(".")[0];
      var date = createdAtTime.split("T")[0];
      var time = createdAtTime.split("T")[1];
      return "$date at $time";
    }
  }

  String get timeAgo {
    final now = DateTime.now();
    final diff = now.difference(this);

    if (diff.inSeconds < 60) {
      return 'just now';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes} min ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours} hour${diff.inHours > 1 ? 's' : ''} ago';
    } else if (diff.inDays < 7) {
      return '${diff.inDays} day${diff.inDays > 1 ? 's' : ''} ago';
    } else if (diff.inDays < 30) {
      final weeks = (diff.inDays / 7).floor();
      return '$weeks week${weeks > 1 ? 's' : ''} ago';
    } else if (diff.inDays < 365) {
      final months = (diff.inDays / 30).floor();
      return '$months month${months > 1 ? 's' : ''} ago';
    } else {
      final years = (diff.inDays / 365).floor();
      return '$years year${years > 1 ? 's' : ''} ago';
    }
  }
}

extension AsyncTryCatch on Function() {
  tryCatch() async {
    try {
      await this();
    } catch (e, stackTrace) {
      errorLog(stackTrace.toString(), source: "Global Try Catch");
    }
  }
}
