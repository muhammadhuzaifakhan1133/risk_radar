import 'package:risk_radar/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LanguageSettingViewModel extends BaseViewModel {
  void back() {
    locator<NavigationService>().back();
  }

  void selectLanguage(index) {
    List<Language> selecetedLangs = languages.where((element) => element.isSelected == true).toList();
    selecetedLangs.first.isSelected = false;
    languages[index].isSelected = true;
    notifyListeners();
  }

  List<Language> languages = [
    Language("English", true),
    Language("Chinese", false),
    Language("Hindi", false),
    Language("Spanish", false),
    Language("Arabic", false),
    Language("Portuguese", false),
    Language("Bengali", false),
    Language("Russian", false),
    Language("Japanese", false),
    Language("Punjabi", false),
    Language("German", false),
    Language("Javanese", false),
    Language("Wu", false),
    Language("Malay", false),
  ];
}

class Language {
  final String name;
  bool isSelected;

  Language(this.name, this.isSelected);
}
