import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/app/app.router.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(
    duration: const Duration(milliseconds: 3000),
    vsync: this,
  );
  @override
  void initState() {
    super.initState();
    animationController.forward();
    animationController.repeat();
    Timer(const Duration(seconds: 3), () {
      locator<NavigationService>()
          .pushNamedAndRemoveUntil(Routes.onBoardingView);
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageConstants.background),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(animationController),
                child: Image.asset(
                  ImageConstants.logo,
                  height: 159.h,
                  width: 158.w,
                )),
            SizedBox(height: 10.h),
            Text('Risk Radar',
                style: TextStyle(
                    fontSize: 29.31.sp,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 8)),
          ],
        ),
      ),
    ));
  }
}
