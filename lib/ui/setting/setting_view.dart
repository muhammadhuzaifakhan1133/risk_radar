import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/app/app.router.dart';
import 'package:risk_radar/ui/setting/setting_viewmodel.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => SettingViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            width: context.width,
            height: context.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstants.background8),
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
                        "Setting",
                        style: TextStyle(fontSize: 23),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          settingTile(
                            context: context,
                            title: "Alert Screen Settings",
                            iconPath: ImageConstants.setting1,
                            onTap: () {
                              locator<NavigationService>()
                                  .navigateToAlertSettingView();
                            },
                          ),
                          settingTile(
                            context: context,
                            title: "Privacy",
                            iconPath: ImageConstants.setting2,
                            onTap: () {
                              locator<NavigationService>()
                                  .navigateToPrivacySettingView();
                            },
                          ),
                          settingTile(
                            context: context,
                            title: "Rescue Team Numbers",
                            iconPath: ImageConstants.setting3,
                            onTap: () {
                              locator<NavigationService>()
                                  .navigateToRescueTeamNumbersView();
                            },
                          ),
                          settingTile(
                            context: context,
                            title: "Safety Measures",
                            iconPath: ImageConstants.setting4,
                            onTap: () {
                              locator<NavigationService>()
                                  .navigateToSafetyMeasuresView();
                            },
                          ),
                          settingTile(
                            context: context,
                            title: "Card Details",
                            iconPath: ImageConstants.setting5,
                            onTap: () {
                              locator<NavigationService>()
                                  .navigateToCardDetailsView();
                            },
                          ),
                          settingTile(
                            context: context,
                            title: "Push Notifications",
                            iconPath: ImageConstants.setting6,
                            onTap: () {
                              locator<NavigationService>()
                                  .navigateToPushNotificationView();
                            },
                          ),
                          settingTile(
                            context: context,
                            title: "Bookmarked Charities",
                            iconPath: ImageConstants.setting7,
                            onTap: () {
                              locator<NavigationService>()
                                  .navigateToBookmarkedCharitiesView();
                            },
                          ),
                          settingTile(
                            context: context,
                            title: "Bookmarked Stories",
                            iconPath: ImageConstants.setting8,
                            onTap: () {
                              locator<NavigationService>()
                                  .navigateToBookmarkedStoriesView();
                            },
                          ),
                          settingTile(
                            context: context,
                            title: "Logout",
                            iconPath: ImageConstants.setting9,
                            onTap: () {
                              locator<NavigationService>()
                                  .pushNamedAndRemoveUntil(Routes.signInView);
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget settingTile(
      {required BuildContext context,
      required String iconPath,
      required String title,
      required Function() onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: context.width * 0.8,
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Image.asset(iconPath),
              const SizedBox(width: 10),
              SizedBox(
                width: context.width * 0.56,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 23),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
