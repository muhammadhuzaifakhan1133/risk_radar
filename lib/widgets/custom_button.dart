import 'package:flutter/material.dart';
import 'package:risk_radar/utils/size_extension.dart';

class CustomButton extends StatelessWidget {
  String title;
  final void Function()? onPressed;
  CustomButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        fixedSize: Size(context.width * 0.8, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(title, style: const TextStyle(fontSize: 30)),
    );
  }
}
