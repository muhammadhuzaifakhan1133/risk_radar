import 'dart:async';

import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  double opacity = 1.0;
  void handleStartUpLogic() async {
    opacity = 1.0;
    Future.delayed(const Duration(seconds: 2), () {
      opacity = 0.0;
      notifyListeners();
    });
    Timer(const Duration(seconds: 3), () {
      locator<NavigationService>()
          .pushNamedAndRemoveUntil(Routes.onBoardingView);
    });
  }
}
