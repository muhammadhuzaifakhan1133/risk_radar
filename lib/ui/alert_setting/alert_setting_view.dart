import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:risk_radar/ui/alert_setting/alert_setting_viewmodel.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:stacked/stacked.dart';

class AlertSettingView extends StatelessWidget {
  const AlertSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => AlertSettingViewModel(),
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
                      const Text(
                        "Alert Screen Settings",
                        style: TextStyle(fontSize: 23),
                      ),
                    ],
                  )
                ],
              )),
            ),
          );
        });
  }
}
