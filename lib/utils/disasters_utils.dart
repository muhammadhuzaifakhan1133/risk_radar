import 'package:flutter/material.dart';
import 'package:risk_radar/ui/disasters/disaster_enum.dart';

getDisasterColor(DisasterType type) {
  switch (type) {
    case DisasterType.earthquake:
      return const Color(0xffCC2531);
    case DisasterType.flood:
      return const Color(0xfff3C8CD6);
    case DisasterType.storm:
      return const Color(0xff2C43BC);
    case DisasterType.cyclone:
      return const Color(0xff6B2CBC);
    default:
      return Colors.black;
  }
}

String getDisasterName(DisasterType type) {
    switch (type) {
      case DisasterType.earthquake:
        return "Earthquake";
      case DisasterType.flood:
        return "Flood";
      case DisasterType.cyclone:
        return "Cyclone";
      case DisasterType.storm:
        return "Storm";
      default:
        return "Disaster";
    }
  }
