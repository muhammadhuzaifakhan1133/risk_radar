import 'package:risk_radar/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PrivacySettingViewModel extends BaseViewModel {
  void back() {
    locator<NavigationService>().back();
  }

  Map<String, bool> selection = {
    "Profile": false,
    "Location": false,
    "Badges": false,
    "Donations": false,
    "Friends": false,
  };

  void changeSelection(String s, bool? value) {
    selection[s] = value!;
    notifyListeners();
  }
}
