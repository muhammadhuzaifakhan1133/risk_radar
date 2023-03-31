import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final Color? filledColor;
  final double? borderRadius;
  final Color? hintTextColor;
  final double? height;
  final double? width;
  final double? hintFontSize;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;
  final bool expands;
  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.expands = false,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.filledColor,
    this.borderRadius,
    this.hintTextColor,
    this.height,
    this.width,
    this.maxLines = 1,
    this.hintFontSize,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50.h,
      width: width ?? 323.w,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        maxLines: maxLines,
        expands: expands,
        decoration: InputDecoration(
            hintText: hintText,
            contentPadding: contentPadding,
            hintStyle: TextStyle(
                color: hintTextColor ?? const Color(0xff706767),
                fontSize: hintFontSize ?? 22.sp),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 15),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 15),
            ),
            filled: true,
            fillColor: filledColor ?? Colors.white.withOpacity(0.5),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon),
      ),
    );
  }
}
