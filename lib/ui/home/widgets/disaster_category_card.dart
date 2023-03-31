import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/utils/size_extension.dart';

Widget disasterCategoryCard(
    {required BuildContext context,
    required String iconPath,
    required void Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 70.h,
      width: 75.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffDCDCDC),
                Color(0xff2238AA).withOpacity(0.5),
              ])),
      child: Image.asset(iconPath),
    ),
  );
}
