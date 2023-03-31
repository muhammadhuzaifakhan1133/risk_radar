 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container storyTag(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 5.w),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 8.sp),
      ),
    );
  }