
  import 'package:flutter/material.dart';
import 'package:risk_radar/utils/size_extension.dart';

Container homeTabCard(
      {required BuildContext context,
      required String title,
      required String iconPath}) {
    return Container(
      height: 55,
      width: context.width * 0.4,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath),
          const SizedBox(width: 10),
          Text(title, style: TextStyle(color: Colors.black, fontSize: 15))
        ],
      ),
    );
  }