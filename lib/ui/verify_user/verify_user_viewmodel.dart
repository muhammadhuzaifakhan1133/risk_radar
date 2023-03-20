import 'package:flutter/material.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class VerifyUserViewModel extends BaseViewModel {
  TextEditingController codeController = TextEditingController();

  void navigateToResetPassword() {
    locator<NavigationService>().navigateToResetPasswordView();
  }
}
