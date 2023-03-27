import 'package:flutter/material.dart';
import 'package:risk_radar/utils/size_extension.dart';

Widget privacySettingTile(
    {required BuildContext context,
    required String title,
    required bool value,
    required Function(String, bool?) onChanged,
    required String key}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15.0),
    child: Container(
      width: context.width * 0.85,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              style: const TextStyle(fontSize: 23),
            ),
          ),
          Checkbox(
              value: value,
              onChanged: (value) {
                onChanged(key, value);
              }),
        ],
      ),
    ),
  );
}
