 import 'package:flutter/material.dart';

Container storyTag(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 8),
      ),
    );
  }