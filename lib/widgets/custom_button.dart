import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/utils/size_extension.dart';

class CustomButton extends StatelessWidget {
  String title;
  final double? width;
  final double? height;
  final double? fontSize;
  final Color? bgColor;
  final double? radius;
  final Color? fontColor;
  final void Function()? onPressed;
  CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    this.height,
    this.width,
    this.fontSize,
    this.bgColor,
    this.radius,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? Colors.black,
        fixedSize: Size(width ?? 301.62.w, height ?? 46.77.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 30),
        ),
      ),
      child: Text(title,
          style: TextStyle(fontSize: fontSize ?? 26.sp, color: fontColor)),
    );
  }
}
