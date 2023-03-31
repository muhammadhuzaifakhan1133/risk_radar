import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/app/app.router.dart';
import 'package:risk_radar/ui/disasters/disaster_enum.dart';
import 'package:risk_radar/ui/home/home_viewmodel.dart';
import 'package:risk_radar/ui/home/widgets/disaster_category_card.dart';
import 'package:risk_radar/ui/home/widgets/donation_card.dart';
import 'package:risk_radar/ui/home/widgets/home_search_bar.dart';
import 'package:risk_radar/ui/home/widgets/home_tab_card.dart';
import 'package:risk_radar/ui/home/widgets/their_stories.dart';
import 'package:risk_radar/ui/home/widgets/world_news.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:risk_radar/widgets/custom_button.dart';
import 'package:risk_radar/widgets/custom_textfield.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, viewModel, child) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                body: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  width: context.width,
                  height: context.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageConstants.background5),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 50.h),
                        HomeSearchBar(
                            searchController: viewModel.searchController),
                        SizedBox(height: 12.h),
                        TabBar(
                          indicator: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          indicatorSize: TabBarIndicatorSize.label,
                          isScrollable: true,
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 6),
                          tabs: [
                            homeTabCard(
                                context: context,
                                title: "World News",
                                iconPath: ImageConstants.newsIcon),
                            homeTabCard(
                                context: context,
                                title: "Stories",
                                iconPath: ImageConstants.storiesIcon),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        SizedBox(
                          height: 161.h,
                          child: const TabBarView(
                            children: [
                              WorldNews(),
                              TheirStories(),
                            ],
                          ),
                        ),
                        SizedBox(height: 19.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Disaster Category",
                              style: TextStyle(
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(height: 9.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            disasterCategoryCard(
                              context: context,
                              iconPath: ImageConstants.earthquakeIcon,
                              onTap: () {
                                locator<NavigationService>()
                                    .navigateToDisastersView(
                                        type: DisasterType.earthquake);
                              },
                            ),
                            disasterCategoryCard(
                              context: context,
                              iconPath: ImageConstants.stormIcon,
                              onTap: () {
                                locator<NavigationService>()
                                    .navigateToDisastersView(
                                        type: DisasterType.storm);
                              },
                            ),
                            disasterCategoryCard(
                              context: context,
                              iconPath: ImageConstants.cycloneIcon,
                              onTap: () {
                                locator<NavigationService>()
                                    .navigateToDisastersView(
                                        type: DisasterType.cyclone);
                              },
                            ),
                            disasterCategoryCard(
                              context: context,
                              iconPath: ImageConstants.floodIcon,
                              onTap: () {
                                locator<NavigationService>()
                                    .navigateToDisastersView(
                                        type: DisasterType.flood);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 18.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Donations for Refugees",
                                style: TextStyle(
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.bold)),
                            Text("See more",
                                style: TextStyle(
                                    color: const Color(0xff3B323E),
                                    fontSize: 12.sp))
                          ],
                        ),
                        SizedBox(height: 11.h),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DonationCard(image: ImageConstants.donations1),
                              SizedBox(width: 24.w),
                              DonationCard(image: ImageConstants.donations2),
                            ])
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
