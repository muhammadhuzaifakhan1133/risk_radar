import 'package:stacked/stacked.dart';

class StoryViewModel extends BaseViewModel {
  List<String> storyDescription = [
    "This is my Survivor story",
    "Songul Yucesoy carefully washes her dishes, soaping the plates and cutlery before rinsing off the bubbles and laying them out to dry. An unremarkable scene, except she's outdoors, sitting in the shadow of her ruined house.",
    "It tilts at an alarming angle, the window frames are hanging out and there's a large chunk of the rusty iron roof now resting in the garden.",
    "It is a month since the devastating earthquakes in Turkey and Syria - with officials putting the number of deaths in Turkey alone at 45,968. In Syria, more than 6,000 are known to have lost their lives.",
    "Those who survived face an uncertain future. One of their most serious problems is finding somewhere safe to live. At least 1.5 million people are now homeless, and it's unclear how long it will take to find them proper shelter.",
    "The Turkish disaster agency Afad, meanwhile, says almost two million people have now left the quake zone. Some are living with friends or loved ones elsewhere in the country. Flights and trains out of the region are free to those who want to leave.",
    "But in the town of Samandag, near the Mediterranean coast, Songul is clear that she and her family aren't going anywhere. 'This is very important for us. Whatever happens next - even if the house falls down - we will stay here. This is our home, our nest. Everything we have is here. We are not going to leave.'",
  ];
  bool isBookmark = false;
  bool isFavorite = false;

  void like() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  void bookmark() {
    isBookmark = !isBookmark;
    notifyListeners();
  }
}
