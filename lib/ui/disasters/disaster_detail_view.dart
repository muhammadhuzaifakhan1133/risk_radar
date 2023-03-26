import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/app/app.router.dart';
import 'package:risk_radar/model/disaster_model.dart';
import 'package:risk_radar/ui/disasters/disaster_enum.dart';
import 'package:risk_radar/ui/disasters/disasters_viewmodel.dart';
import 'package:risk_radar/ui/disasters/widgets/disaster_info_card.dart';
import 'package:risk_radar/utils/disasters_utils.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:risk_radar/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DisasterDetailView extends StatelessWidget {
  final DisasterModel disaster;
  final DisasterType type;
  const DisasterDetailView(
      {super.key, required this.disaster, required this.type});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => DisastersViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              width: context.width,
              height: context.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstants.background8),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                  child: Column(
                children: [
                  AppBar(
                    leading: IconButton(
                      onPressed: () {
                        locator<NavigationService>().back();
                      },
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.black),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          disaster.location,
                          style: const TextStyle(
                              color: Color(0xff413C3C), fontSize: 19),
                        ),
                        Text(
                          disaster.locationDetail,
                          style: const TextStyle(
                              color: Color(0xff626060), fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Image.asset(getDisasterDetailedMap(type)),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 20),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: getDisasterColor(type),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  disaster.magnitude.toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${getDisasterName(type)} Details",
                                  style: const TextStyle(
                                      color: Color(0xff413C3C), fontSize: 19),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  getDisasterDiscription(type),
                                  style: const TextStyle(
                                      color: Color(0xff7A7272), fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Divider(thickness: 2),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                disasterInfoCard(
                                  icon: ImageConstants.disasterTimeIcon,
                                  title: "Date & Time",
                                  value: disaster.date,
                                ),
                                const SizedBox(height: 20),
                                disasterInfoCard(
                                  icon: ImageConstants.disasterRadiusIcon,
                                  title: "Radius",
                                  value: "${disaster.radius} meters",
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                disasterInfoCard(
                                    icon: type == DisasterType.earthquake
                                        ? ImageConstants.disasterDepthIcon1
                                        : ImageConstants.disasterDepthIcon2,
                                    title: "Depth",
                                    value: "${disaster.depth} miles"),
                                const SizedBox(height: 20),
                                disasterInfoCard(
                                    icon: ImageConstants.disasterLocationIcon,
                                    title: "Location",
                                    value:
                                        "${disaster.lat}'N, ${disaster.lng}'W"),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 25),
                        CustomButton(
                          title: "Donate Now",
                          bgColor: Colors.white.withOpacity(0.5),
                          width: context.width * 0.63,
                          fontSize: 15,
                          fontColor: Colors.black,
                          radius: 15,
                          onPressed: () {
                            locator<NavigationService>()
                                .navigateToDonateView();
                          },
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  )
                ],
              )),
            ),
          );
        });
  }

 

  String getDisasterDetailedMap(DisasterType type) {
    switch (type) {
      case DisasterType.flood:
        return ImageConstants.floodDetailedMap;
      case DisasterType.storm:
        return ImageConstants.stormDetailedMap;
      case DisasterType.earthquake:
        return ImageConstants.earthquakeDetailedMap;
      case DisasterType.cyclone:
        return ImageConstants.cycloneDetailedMap;
      default:
        return "";
    }
  }

  String getDisasterDiscription(DisasterType type) {
    switch (type) {
      case DisasterType.earthquake:
        return "Felt only be sensitive people";
      default:
        return "10 peoples were affected";
    }
  }
}
