import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/app/app.router.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  List<String> peoples = [
    ImageConstants.people1,
    ImageConstants.people2,
    ImageConstants.people3,
    ImageConstants.people4,
    ImageConstants.people5,
  ];
  List<String> badges = [
    ImageConstants.badge1,
    ImageConstants.badge2,
    ImageConstants.badge3,
    ImageConstants.badge4,
  ];
  void back() {
    locator<NavigationService>().back();
  }

  void navigateToSetting() {
    locator<NavigationService>().navigateToSettingView();
  }
}
