import 'package:risk_radar/model/people_model.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:stacked/stacked.dart';

class FriendsFamilyViewModel extends BaseViewModel {
  List<People> peoples = [
    People(
        imagePath: ImageConstants.people1,
        name: "Emma Hayward",
        location: "Birmingham, UK",
        status: Status.safe),
    People(
        imagePath: ImageConstants.people2,
        name: "Logan Huntzberger",
        location: "Birmingham, UK",
        status: Status.danger),
    People(
        imagePath: ImageConstants.people3,
        name: "Samantha Smith",
        location: "Dubai UAE",
        status: Status.unknown),
    People(
        imagePath: ImageConstants.people4,
        name: "Alex Johnson",
        location: "Birmingham, UK",
        status: Status.safe),
    People(
        imagePath: ImageConstants.people6,
        name: "Steven Musk",
        location: "Washington DC, USA",
        status: Status.safe),
    People(
        imagePath: ImageConstants.people7,
        name: "Meagan Gilmore",
        location: "Birmingham, UK",
        status: Status.safe),
    People(
        imagePath: ImageConstants.people5,
        name: "Neil Jonas",
        location: "New York, USA",
        status: Status.safe),
  ];
}
