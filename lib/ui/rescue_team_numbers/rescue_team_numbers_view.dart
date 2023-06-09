import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/ui/rescue_team_numbers/rescue_team_numbers_viewmodel.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:stacked/stacked.dart';

class RescueTeamNumbersView extends StatelessWidget {
  const RescueTeamNumbersView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => RescueTeamNumbersViewModel(),
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
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            viewModel.back();
                          },
                          icon: const Icon(Icons.arrow_back_ios)),
                      const SizedBox(width: 10),
                       Text(
                        "Rescue Team Numbers",
                        style: TextStyle(fontSize: 23.sp),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  rescueContactWidget("Abc Team near City, Country"),
                  const SizedBox(height: 10),
                  rescueContactWidget("Abc Team"),
                ],
              )),
            ),
          );
        });
  }

  Widget rescueContactWidget(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 23.sp, color: Color(0xff393434)),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
                child: Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "XXXX-XXX-XXX",
                  style: TextStyle(color: Color(0xff393434), fontSize: 23.sp),
                ),
              ),
            )),
            const SizedBox(width: 10),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(Icons.phone),
            )
          ],
        )
      ],
    );
  }
}
