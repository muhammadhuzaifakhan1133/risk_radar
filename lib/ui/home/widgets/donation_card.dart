import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/app/app.router.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:risk_radar/widgets/custom_button.dart';
import 'package:stacked_services/stacked_services.dart';

class DonationCard extends StatelessWidget {
  const DonationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          locator<NavigationService>().navigateToDonationView();
        },
        child: SizedBox(
          width: 160.w,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 160.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white.withOpacity(0.4),
                    ),
                  ),
                  Positioned(
                    bottom: 9.h,
                    right: 9.w,
                    child: CustomButton(
                        title: "Donate Now",
                        height: 27.h,
                        width: 83.w,
                        fontSize: 10.sp,
                        onPressed: () {
                          locator<NavigationService>().navigateToDonateView();
                        }),
                  )
                ],
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child:
                    Text("Insert text here", style: TextStyle(fontSize: 12.sp)),
              ),
              SizedBox(height: 5.h),
              const LinearProgressIndicator(
                  value: 0.5,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black)),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total raised",
                      style: TextStyle(
                          fontSize: 12.sp, color: const Color(0xff676161))),
                  Text.rich(
                    TextSpan(
                      text: "\$454,879",
                      style: TextStyle(fontSize: 12.sp),
                      children: [
                        TextSpan(
                          text: "(50%)",
                          style: TextStyle(
                              fontSize: 12.sp, color: const Color(0xff676161)),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
