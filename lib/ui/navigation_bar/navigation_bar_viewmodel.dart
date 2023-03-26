import 'package:flutter/material.dart';
import 'package:risk_radar/ui/friends_family/friends_family_view.dart';
import 'package:risk_radar/ui/home/home_view.dart';
import 'package:risk_radar/ui/notifications/notifications_view.dart';
import 'package:stacked/stacked.dart';

class NavigationBarViewModel extends BaseViewModel {
  int currentIndex = 0;
  List<Widget> screens = const [
    HomeView(),
    FriendsFamilyView(),
    NotificationsView()
  ];
}
