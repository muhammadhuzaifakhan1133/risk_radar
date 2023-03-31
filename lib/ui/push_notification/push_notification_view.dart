import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/ui/privacy_setting/privacy_setting_viewmodel.dart';
import 'package:risk_radar/ui/privacy_setting/widget/privacy_setting_tile.dart';
import 'package:risk_radar/ui/push_notification/push_notification_viewmodel.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:stacked/stacked.dart';

class PushNotificationView extends StatelessWidget {
  const PushNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
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
                      Text(
                        "Push Notification",
                        style: TextStyle(fontSize: 23.sp),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  privacySettingTile(
                      context: context,
                      title: "Stories Notifications",
                      value: viewModel.selection["Stories"]!,
                      onChanged: viewModel.changeSelection,
                      key: "Stories"),
                  privacySettingTile(
                      context: context,
                      title: "Donations Notifications",
                      value: viewModel.selection["Donations"]!,
                      onChanged: viewModel.changeSelection,
                      key: "Donations"),
                  privacySettingTile(
                      context: context,
                      title: "Liked Posts Notifications",
                      value: viewModel.selection["Posts"]!,
                      onChanged: viewModel.changeSelection,
                      key: "Posts"),
                  privacySettingTile(
                      context: context,
                      title: "Friends Notifications",
                      value: viewModel.selection["Friends"]!,
                      onChanged: viewModel.changeSelection,
                      key: "Friends"),
                  privacySettingTile(
                      context: context,
                      title: "Family Notifications",
                      value: viewModel.selection["Family"]!,
                      onChanged: viewModel.changeSelection,
                      key: "Family"),
                ],
              )),
            ),
          );
        });
  }
}
