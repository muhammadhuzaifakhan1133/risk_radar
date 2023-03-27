import 'package:risk_radar/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RescueTeamNumbersViewModel extends BaseViewModel {
  void back() {
    locator<NavigationService>().back();
  }

}