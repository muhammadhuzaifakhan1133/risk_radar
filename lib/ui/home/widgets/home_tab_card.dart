import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/utils/size_extension.dart';

Container homeTabCard(
    {required BuildContext context,
    required String title,
    required String iconPath}) {
  return Container(
    height: 43.h,
    width: 171.w,
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.3),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(iconPath),
        SizedBox(width: 14.h),
        Text(title, style: TextStyle(color: Colors.black, fontSize: 15.sp))
      ],
    ),
  );
}
