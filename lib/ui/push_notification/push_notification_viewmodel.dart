import 'package:risk_radar/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PushNotificationViewModel extends BaseViewModel {
  void back() {
    locator<NavigationService>().back();
  }

    Map<String, bool> selection = {
    "Stories": false,
    "Donations": false,
    "Posts": false,
    "Friends": false,
    "Family": false,
  };

  void changeSelection(String s, bool? value) {
    selection[s] = value!;
    notifyListeners();
  }

}