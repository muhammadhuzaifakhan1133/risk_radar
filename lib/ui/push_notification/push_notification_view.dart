import 'package:flutter/material.dart';
import 'package:risk_radar/ui/privacy_setting/privacy_setting_viewmodel.dart';
import 'package:risk_radar/ui/push_notification/push_notification_viewmodel.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:stacked/stacked.dart';

class PushNotificationView extends StatelessWidget {
  const PushNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => PushNotificationViewModel(),
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
                        "Push Notification",
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
