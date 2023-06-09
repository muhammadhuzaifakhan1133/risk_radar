import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:risk_radar/model/onboading_model.dart';
import 'package:risk_radar/ui/onboarding/onboarding_viewmodel.dart';
import 'package:risk_radar/ui/onboarding/widgets/onboarding_widget.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:risk_radar/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => OnBoardingViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstants.background),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 42.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageConstants.logo,
                      height: 70.h,
                      width: 71.w,
                    ),
                    SizedBox(width: 9.w),
                    Text(
                      "Risk Radar",
                      style: TextStyle(fontSize: 18.sp),
                    )
                  ],
                ),
                SizedBox(height: 49.h),
                SizedBox(
                  height: 580.h,
                  child: IntroSlider(
                    refFuncGoToTab: (function) {
                      viewModel.sliderRefFunction = function;
                    },
                    isShowNextBtn: false,
                    isShowSkipBtn: false,
                    isShowDoneBtn: false,
                    isShowPrevBtn: false,
                    onTabChangeCompleted: (index) {
                      viewModel.currentIndex = index;
                      viewModel.notifyListeners();
                    },
                    indicatorConfig: const IndicatorConfig(
                      colorActiveIndicator: Colors.blue,
                      colorIndicator: Colors.black,
                      sizeIndicator: 20,
                    ),
                    listCustomTabs: [
                      for (onBoardingModel screenData in viewModel.screensData)
                        OnBoardingWidget(
                          title: screenData.title,
                          description: screenData.description,
                          imagePath: screenData.image,
                        )
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
                CustomButton(
                  title: viewModel.currentIndex !=
                          (viewModel.screensData.length - 1)
                      ? "Next"
                      : "Get Started",
                  onPressed: () {
                    if (viewModel.currentIndex !=
                        viewModel.screensData.length - 1) {
                      viewModel.sliderRefFunction!(viewModel.currentIndex + 1);
                    } else {
                      viewModel.navigateToSignIn();
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
