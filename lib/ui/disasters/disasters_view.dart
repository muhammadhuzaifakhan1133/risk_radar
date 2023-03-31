import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/ui/disasters/disaster_enum.dart';
import 'package:risk_radar/ui/disasters/disasters_viewmodel.dart';
import 'package:risk_radar/ui/disasters/widgets/disasters_country_card.dart';
import 'package:risk_radar/ui/disasters/widgets/precaution_dialog.dart';
import 'package:risk_radar/utils/disasters_utils.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DisastersView extends StatelessWidget {
  final DisasterType type;
  const DisastersView({super.key, required this.type});

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
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    leading: IconButton(
                      onPressed: () {
                        locator<NavigationService>().back();
                      },
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.black),
                    ),
                    title: Text("Recent ${getDisasterName(type)}s",
                        style: TextStyle(color: Colors.black, fontSize: 19.sp)),
                    actions: [
                      InkWell(
                          onTap: () {
                            precautionDialog(context, type);
                          },
                          child: Image.asset(ImageConstants.precautionIcon))
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Image.asset(
                    getDisasterMap(type),
                    height: 272.h,
                    width: 371.w,
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: ListView.separated(
                      itemCount: viewModel.disasters.length,
                      itemBuilder: (context, index) {
                        return DisasterCountryCard(
                            disaster: viewModel.disasters[index], type: type);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ));
        });
  }

  String getDisasterMap(DisasterType type) {
    switch (type) {
      case DisasterType.earthquake:
        return ImageConstants.earthquakeMap;
      case DisasterType.flood:
        return ImageConstants.floodMap;
      case DisasterType.cyclone:
        return ImageConstants.cycloneMap;
      case DisasterType.storm:
        return ImageConstants.stormMap;
      default:
        return "";
    }
  }
}
