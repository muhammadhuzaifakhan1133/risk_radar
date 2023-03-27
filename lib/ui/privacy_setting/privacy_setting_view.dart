import 'package:flutter/material.dart';
import 'package:risk_radar/ui/privacy_setting/privacy_setting_viewmodel.dart';
import 'package:risk_radar/ui/privacy_setting/widget/privacy_setting_tile.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:stacked/stacked.dart';

class PrivacySettingView extends StatelessWidget {
  const PrivacySettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => PrivacySettingViewModel(),
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
                        "Privacy",
                        style: TextStyle(fontSize: 23),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  privacySettingTile(
                      context: context,
                      title: "Keep profile private",
                      value: viewModel.selection["Profile"]!,
                      onChanged: viewModel.changeSelection,
                      key: "Profile"),
                  privacySettingTile(
                      context: context,
                      title: "Show location on profile",
                      value: viewModel.selection["Location"]!,
                      onChanged: viewModel.changeSelection,
                      key: "Location"),
                  privacySettingTile(
                      context: context,
                      title: "Show badges on profile",
                      value: viewModel.selection["Badges"]!,
                      onChanged: viewModel.changeSelection,
                      key: "Badges"),
                  privacySettingTile(
                      context: context,
                      title: "Show donations on profile",
                      value: viewModel.selection["Donations"]!,
                      onChanged: viewModel.changeSelection,
                      key: "Donations"),
                  privacySettingTile(
                      context: context,
                      title: "Show friends on sdfdsfds profile",
                      value: viewModel.selection["Friends"]!,
                      onChanged: viewModel.changeSelection,
                      key: "Friends"),
                ],
              )),
            ),
          );
        });
  }
}
