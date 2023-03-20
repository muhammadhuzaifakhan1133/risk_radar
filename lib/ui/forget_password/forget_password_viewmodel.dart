import 'package:flutter/material.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgetPasswordViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();

  void navigateToVerifyUserView() {
    locator<NavigationService>().navigateToVerifyUserView();
  }
}
