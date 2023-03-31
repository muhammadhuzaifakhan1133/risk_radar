import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/ui/notifications/notifications_viewmodel.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:stacked/stacked.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => NotificationsViewModel(),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 37.w),
                      child: Text(
                        "Notifications",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 23.sp),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Expanded(
                      child: ListView.separated(
                        itemCount: viewModel.notifications.length,
                        separatorBuilder: (context, index) => const Divider(
                          height: 5,
                          thickness: 2,
                        ),
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading:
                                Image.asset(ImageConstants.notificationLeading),
                            title: Text(
                              viewModel.notifications[index],
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          );
                        },
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
