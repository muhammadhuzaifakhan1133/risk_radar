import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/ui/profile/profile_viewmodel.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => ProfileViewModel(),
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppBar(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      leading: IconButton(
                          onPressed: () {
                            viewModel.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          )),
                      title: Text(
                        "My Profile",
                        style: TextStyle(color: Colors.black, fontSize: 19.sp),
                      ),
                      actions: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit_note,
                              color: Colors.black,
                            )),
                        IconButton(
                            onPressed: () {
                              viewModel.navigateToSetting();
                            },
                            icon: const Icon(
                              Icons.settings,
                              color: Colors.black,
                            ))
                      ],
                    ),
                    SizedBox(height: 27.h),
                    Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(ImageConstants.profile))),
                    ),
                    SizedBox(height: 6.h),
                    Text("Eva Zu Beck",
                        style: TextStyle(
                          color: const Color(0xff413C3C),
                          fontSize: 19.sp,
                        )),
                    SizedBox(height: 2.h),
                    Text(
                      "Birmingham, UK",
                      style: TextStyle(
                          color: const Color(0xff626060), fontSize: 12.sp),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      width: 371.w,
                      height: 503.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "A little bit about me:",
                              style: TextStyle(
                                  color: const Color(0xff413C3C),
                                  fontSize: 19.sp),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "Hi! I am Eva and I’m a survivor of the Earthquake of 2.8 magnitude",
                              style: TextStyle(
                                  color: const Color(0xff626060),
                                  fontSize: 14.sp),
                            ),
                            SizedBox(height: 10.h),
                            const Divider(thickness: 2),
                            SizedBox(height: 10.h),
                            Text(
                              "Donations made:",
                              style: TextStyle(
                                  color: const Color(0xff413C3C),
                                  fontSize: 19.sp),
                            ),
                            SizedBox(height: 10.h),
                            Container(
                              width: 125.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 10.w),
                                  Image.asset(ImageConstants.donationIcon),
                                  SizedBox(width: 10.w),
                                  Text(
                                    "\$500",
                                    style: TextStyle(
                                        color: const Color(0xff626060),
                                        fontSize: 15.sp),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            const Divider(thickness: 2),
                            SizedBox(height: 10.h),
                            // ignore: prefer_const_constructors
                            Text(
                              "My Friends & Family:",
                              style: TextStyle(
                                  color: const Color(0xff413C3C),
                                  fontSize: 19.sp),
                            ),
                            SizedBox(height: 15.h),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (String people in viewModel.peoples)
                                    Container(
                                      width: 40.w,
                                      height: 40.h,
                                      margin: EdgeInsets.only(right: 10.w),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(people),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    "See more...",
                                    style: TextStyle(
                                        color: const Color(0xff626060),
                                        fontSize: 12.sp),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            const Divider(thickness: 2),
                            SizedBox(height: 10.h),
                            Text(
                              "Badges earned:",
                              style: TextStyle(
                                  color: const Color(0xff413C3C),
                                  fontSize: 19.sp),
                            ),
                            SizedBox(height: 10.h),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (String badge in viewModel.badges)
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Image.asset(badge),
                                    )
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            const Divider(thickness: 2),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
