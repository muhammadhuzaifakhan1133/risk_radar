 import 'package:flutter/material.dart';

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
              style: TextStyle(color: Color(0xff090808), fontSize: 15),
            ),
            Text(
              value,
              style: TextStyle(
                color: Color(0xff7A7272),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }