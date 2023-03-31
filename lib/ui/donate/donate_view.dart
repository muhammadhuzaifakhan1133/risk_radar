import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/app/app.router.dart';
import 'package:risk_radar/ui/donate/donate_viewmodel.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:risk_radar/widgets/custom_button.dart';
import 'package:risk_radar/widgets/custom_textfield.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DonateView extends StatelessWidget {
  const DonateView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => DonateViewModel(),
      builder: (context, viewModel, child) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                locator<NavigationService>().back();
                              },
                              icon: const Icon(Icons.arrow_back_ios)),
                          const SizedBox(width: 10),
                          Text(
                            "Donate Now",
                            style: TextStyle(fontSize: 23.sp),
                          ),
                        ],
                      ),
                      SizedBox(height: 25.h),
                      Image.asset(
                        ImageConstants.donate,
                        height: 281.h,
                        width: 362.w,
                      ),
                      SizedBox(height: 25.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text.rich(TextSpan(
                                  text: "Organized by ",
                                  style: TextStyle(fontSize: 15.sp),
                                  children: [
                                    TextSpan(
                                        text: "Eye on Turkey",
                                        style: TextStyle(
                                            color: Color(0xff8C3283),
                                            fontSize: 15.sp))
                                  ])),
                              SizedBox(width: 5),
                              Icon(Icons.check_circle, color: Color(0xff8C3283))
                            ],
                          ),
                          Text(
                            "50 days left",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.sp),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "Donate to help Turkey recover",
                        style: TextStyle(
                            fontSize: 23.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20.h),
                      const CustomTextField(
                        hintText: "Enter Amount",
                      ),
                      SizedBox(height: 20.h),
                      CustomButton(
                          title: "Donate Now",
                          onPressed: () {
                            locator<NavigationService>()
                                .navigateToPaymentView();
                          })
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
