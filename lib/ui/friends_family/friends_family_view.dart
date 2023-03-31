import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/app/app.router.dart';
import 'package:risk_radar/model/people_model.dart';
import 'package:risk_radar/ui/disasters/disaster_enum.dart';
import 'package:risk_radar/ui/disasters/widgets/precaution_dialog.dart';
import 'package:risk_radar/ui/friends_family/friends_family_viewmodel.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FriendsFamilyView extends StatelessWidget {
  const FriendsFamilyView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => FriendsFamilyViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
              body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            width: context.width,
            height: context.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstants.background6),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: Text(
                      "Friends & Family",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19.sp,
                      ),
                    ),
                    actions: [
                      InkWell(
                          onTap: () {
                            safetyMeasuresDialog(context);
                          },
                          child: Image.asset(ImageConstants.safetyMeasuresIcon))
                    ],
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      Container(
                        width: 363.w,
                        height: 614.h,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    "Total Friends: 9",
                                    style: TextStyle(
                                      color: Color(0xff626060),
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset(ImageConstants.greenCircle),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Safe",
                                      style: TextStyle(
                                          color: Color(0xff626060),
                                          fontSize: 12.sp),
                                    ),
                                    const SizedBox(width: 8),
                                    Image.asset(ImageConstants.redCircle),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Unsafe",
                                      style: TextStyle(
                                          color: Color(0xff626060),
                                          fontSize: 12.sp),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: viewModel.peoples.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: Image.asset(
                                          viewModel.peoples[index].imagePath),
                                      title: Text(
                                        viewModel.peoples[index].name,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.sp),
                                      ),
                                      subtitle: Text(
                                        viewModel.peoples[index].location,
                                        style: TextStyle(
                                            color: Color(0xff626060),
                                            fontSize: 12.sp),
                                      ),
                                      trailing: Image.asset(viewModel
                                                  .peoples[index].status ==
                                              Status.safe
                                          ? ImageConstants.greenCircle
                                          : viewModel.peoples[index].status ==
                                                  Status.danger
                                              ? ImageConstants.redCircle
                                              : ImageConstants.greyCircle),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        right: 30,
                        child: InkWell(
                            onTap: () {
                              locator<NavigationService>()
                                  .navigateToAddFriendsFamilyView();
                            },
                            child: Image.asset(ImageConstants.addPeople)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ));
        });
  }

  safetyMeasuresDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Center(
                  child: Text(
                "Safety Measures",
                style: TextStyle(fontSize: 24.sp),
              )),
              content: SizedBox(
                width: context.width * 0.8,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        safetyMeasureCard(
                            context,
                            ImageConstants.earthquakeIcon,
                            DisasterType.earthquake),
                        safetyMeasureCard(context, ImageConstants.stormIcon,
                            DisasterType.storm)
                      ],
                    ),
                    Row(
                      children: [
                        safetyMeasureCard(context, ImageConstants.floodIcon,
                            DisasterType.flood),
                        safetyMeasureCard(context, ImageConstants.cycloneIcon,
                            DisasterType.cyclone),
                      ],
                    ),
                  ],
                ),
              ));
        });
  }

  Widget safetyMeasureCard(
      BuildContext context, String icon, DisasterType type) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          locator<NavigationService>().back();
          precautionDialog(context, type, isPrecaution: false);
        },
        child: Card(
          elevation: 15,
          child: Container(
            height: context.height * 0.15,
            width: context.width * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 172, 149, 248),
                      Colors.white
                    ])),
            child: Center(child: Image.asset(icon)),
          ),
        ),
      ),
    );
  }
}
