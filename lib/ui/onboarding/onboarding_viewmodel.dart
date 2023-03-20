import 'package:flutter/material.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/app/app.router.dart';
import 'package:risk_radar/model/onboading_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnBoardingViewModel extends BaseViewModel {
  Function? sliderRefFunction;
  int currentIndex = 0;
  List<onBoardingModel> screensData = [
    onBoardingModel(
      title: 'Welcome to Risk Radar',
      description: 'We are here to always alert you of your surroundings.',
      image: 'assets/images/onboarding1.png',
    ),
    onBoardingModel(
      title: 'Alert System',
      description:
          'Our system alerts for disasters instantly and ensures you take the right safety measures.',
      image: 'assets/images/onboarding2.png',
    ),
    onBoardingModel(
      title: 'Weather Storms',
      description:
          'Whether it be a weather storm, an earthquake, a cyclone or flood. We are here for you.',
      image: 'assets/images/onboarding3.png',
    ),
  ];

  void navigateToSignIn() {
    locator<NavigationService>().pushNamedAndRemoveUntil(Routes.signInView);
  }
}
