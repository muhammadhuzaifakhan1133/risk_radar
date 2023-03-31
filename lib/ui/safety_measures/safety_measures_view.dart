import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/ui/safety_measures/safety_measures_viewmodel.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:stacked/stacked.dart';

class SafetyMeasuresView extends StatelessWidget {
  const SafetyMeasuresView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => SafetyMeasuresViewModel(),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            viewModel.back();
                          },
                          icon: const Icon(Icons.arrow_back_ios)),
                      const SizedBox(width: 10),
                      Text(
                        "Safety Measures",
                        style: TextStyle(fontSize: 23.sp),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "  Note",
                    style: TextStyle(fontSize: 23.sp),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: context.width * 0.9,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Voice assistant will always remain on in emergency cases",
                      style: TextStyle(fontSize: 23.sp, color: Color(0xff393434)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: context.width * 0.9,
                    height: context.height * 0.6,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Safety measures:",
                      style: TextStyle(color: Color(0xff393434), fontSize: 23.sp),
                    ),
                  )
                ],
              )),
            ),
          );
        });
  }
}
