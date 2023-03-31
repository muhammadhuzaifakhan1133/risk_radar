 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Row disasterInfoCard(
      {required String icon, required String title, required String value}) {
    return Row(
      children: [
        Image.asset(icon),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: Color(0xff090808), fontSize: 15.sp),
            ),
            Text(
              value,
              style: TextStyle(
                color: Color(0xff7A7272),
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }