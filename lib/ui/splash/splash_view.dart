import 'dart:async';

import 'package:flutter/material.dart';
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
                child: Image.asset(ImageConstants.logo)),
            const SizedBox(height: 15),
            const Text('Risk Radar',
                style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold, wordSpacing: 8)),
          ],
        ),
      ),
    ));
  }
}
