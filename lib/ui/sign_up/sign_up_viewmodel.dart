import 'package:flutter/material.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool obscureText = true;
  bool agree = false;

  void togglePasswordVisibility() {
    obscureText = !obscureText;
    notifyListeners();
  }

  void toggleAgree(bool? value) {
    agree = value!;
    notifyListeners();
  }

  void navigateToSignIn() {
    locator<NavigationService>().back();
  }

  void signUp() {
    locator<NavigationService>().navigateToVerifyUserView();
  }
}
