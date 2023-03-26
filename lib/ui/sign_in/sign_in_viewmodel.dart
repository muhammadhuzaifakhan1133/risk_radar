import 'package:flutter/material.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignInViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  void togglePasswordVisibility() {
    obscureText = !obscureText;
    notifyListeners();
  }

  void navigateToSignUp() {
    locator<NavigationService>().navigateToSignUpView();
  }

  void navigateToForgotPassword() {
    locator<NavigationService>().navigateToForgetPasswordView();
  }

  void navigateToHome() {
    locator<NavigationService>()
        .pushNamedAndRemoveUntil(Routes.navigationBarView);
  }
}
