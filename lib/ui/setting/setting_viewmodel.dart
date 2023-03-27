import 'package:risk_radar/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingViewModel extends BaseViewModel {
  void back() {
    locator<NavigationService>().back();
  }
}
