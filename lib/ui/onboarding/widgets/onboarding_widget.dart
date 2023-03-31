import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/utils/size_extension.dart';

class OnBoardingWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  const OnBoardingWidget(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 343.65.h,
            width: 328.w,
          ),
          SizedBox(height: 29.35.h),
          Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 11.h),
          SizedBox(
            width: 299.w,
            child: Text(description,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                )),
          ),
          SizedBox(height: 33.h),
        ],
      ),
    );
  }
}
