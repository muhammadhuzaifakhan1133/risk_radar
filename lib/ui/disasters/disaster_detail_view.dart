import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppBar(
                      leading: IconButton(
                        onPressed: () {
                          locator<NavigationService>().back();
                        },
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.black),
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
                            style: TextStyle(
                                color: Color(0xff413C3C), fontSize: 19.sp),
                          ),
                          Text(
                            disaster.locationDetail,
                            style: TextStyle(
                                color: Color(0xff626060), fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 18.h),
                    Image.asset(
                      getDisasterDetailedMap(type),
                      height: 353.h,
                      width: 371.w,
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: SingleChildScrollView(
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
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18.sp),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${getDisasterName(type)} Details",
                                      style: TextStyle(
                                          color: Color(0xff413C3C),
                                          fontSize: 19.sp),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      getDisasterDiscription(type),
                                      style: TextStyle(
                                          color: Color(0xff7A7272),
                                          fontSize: 12.sp),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 15.h),
                            const Divider(thickness: 2),
                            SizedBox(height: 15.h),
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
                                        icon:
                                            ImageConstants.disasterLocationIcon,
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
                              width: 271.w,
                              height: 44.h,
                              fontSize: 15.sp,
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
                      ),
                    )
                  ],
                ),
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
