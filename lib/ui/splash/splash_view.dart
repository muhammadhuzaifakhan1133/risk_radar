import 'package:flutter/material.dart';
import 'package:risk_radar/ui/splash/splash_viewmodel.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => SplashViewModel(),
        onViewModelReady: (viewModel) {
          viewModel.handleStartUpLogic();
        },
        builder: (context, viewModel, child) {
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
                  Image.asset(ImageConstants.logo),
                  const SizedBox(height: 15),
                  const Text('Risk Radar',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          wordSpacing: 8)),
                ],
              ),
            ),
          ));
        });
  }
}
