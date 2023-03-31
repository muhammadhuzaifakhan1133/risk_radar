import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/app/app.router.dart';
import 'package:risk_radar/ui/donation/donation_viewmodel.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:risk_radar/widgets/custom_button.dart';
import 'package:risk_radar/widgets/story_tag.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DonationView extends StatelessWidget {
  const DonationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => DonationViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Container(
            width: context.width,
            height: context.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
                image: AssetImage(ImageConstants.storyImage),
              ),
            ),
            child: SafeArea(
                child: Stack(
              children: [
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        width: context.width,
                        height: context.height * 0.6,
                        padding: EdgeInsets.only(
                            top: 47.h, right: 20.w, left: 28.w, bottom: 20.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        storyTag("Earthquake"),
                                        SizedBox(width: 10.w),
                                        storyTag("Turkey"),
                                      ],
                                    ),
                                    SizedBox(height: 15.h),
                                    Text(
                                      "Help the people in Turkey recover from earthquakes",
                                      style: TextStyle(fontSize: 23.sp),
                                    ),
                                    SizedBox(height: 8.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text.rich(TextSpan(
                                                text: "Organized by ",
                                                style:
                                                    TextStyle(fontSize: 15.sp),
                                                children: [
                                                  TextSpan(
                                                      text: "Eye on Turkey",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff8C3283),
                                                          fontSize: 15.sp))
                                                ])),
                                            SizedBox(width: 5),
                                            Icon(Icons.check_circle,
                                                color: Color(0xff8C3283))
                                          ],
                                        ),
                                        Text(
                                          "50 days left",
                                          style: TextStyle(
                                              color: Color(0xff7D777D),
                                              fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    LinearProgressIndicator(
                                      value: 0.5,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Color(0xff8C3283)),
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Raised amount",
                                          style: TextStyle(
                                              color: Color(0xff958B8C),
                                              fontSize: 15.sp),
                                        ),
                                        Text(
                                          "Target",
                                          style: TextStyle(
                                              color: Color(0xff958B8C),
                                              fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text.rich(TextSpan(
                                            text: "\$500.25 ",
                                            style: TextStyle(fontSize: 15),
                                            children: [
                                              TextSpan(
                                                text: "(50)",
                                                style: TextStyle(
                                                    color: Color(0xff958B8C),
                                                    fontSize: 15.sp),
                                              )
                                            ])),
                                        Text(
                                          "\$1000",
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Recent Donors",
                                        style: TextStyle(
                                            color: Color(0xff958B8C),
                                            fontSize: 15.sp),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      children: [
                                        for (String donor in viewModel.donors)
                                          Container(
                                            width: 40.w,
                                            height: 40.h,
                                            margin:
                                                EdgeInsets.only(right: 19.w),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: AssetImage(donor),
                                              ),
                                            ),
                                          ),
                                        Container(
                                            width: 40.w,
                                            height: 40.h,
                                            margin:
                                                EdgeInsets.only(right: 19.w),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff8C3283),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "10+",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12.sp),
                                              ),
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: 15.h),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "More about us:",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    ListView.builder(
                                      itemCount: viewModel.description.length,
                                      shrinkWrap: true,
                                      primary: false,
                                      itemBuilder: (context, index) {
                                        return Text(
                                            viewModel.description[index],
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(fontSize: 15.sp));
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ))),
                Positioned(
                    bottom: 15,
                    right: 15,
                    child: CustomButton(
                      title: "Donate",
                      width: 122.w,
                      height: 35.h,
                      bgColor: Colors.black.withOpacity(0.6),
                      fontSize: 18.sp,
                      onPressed: () {
                        locator<NavigationService>().navigateToDonateView();
                      },
                    )),
                Positioned(
                  top: context.height * 0.35,
                  right: context.width * 0.1,
                  child: InkWell(
                    onTap: () {
                      viewModel.bookmark();
                    },
                    child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 30,
                        child: Icon(
                          viewModel.isBookmark
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          size: 35,
                          color: Colors.white,
                        )),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: IconButton(
                      onPressed: () {
                        locator<NavigationService>().back();
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                )
              ],
            )),
          ),
        );
      },
    );
  }
}
