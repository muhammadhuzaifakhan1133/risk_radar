import 'dart:async';

import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  void handleStartUpLogic() async {
    Timer(const Duration(seconds: 3), () {
      locator<NavigationService>()
          .pushNamedAndRemoveUntil(Routes.onBoardingView);
    });
  }
}
