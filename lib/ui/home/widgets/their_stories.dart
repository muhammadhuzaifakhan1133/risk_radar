import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/app/app.router.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:stacked_services/stacked_services.dart';

class TheirStories extends StatelessWidget {
  const TheirStories({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> stories = [
      ImageConstants.storiesBg1,
      ImageConstants.storiesBg2,
      ImageConstants.storiesBg3,
      ImageConstants.storiesBg4,
      ImageConstants.storiesBg5,
      ImageConstants.storiesBg6,
    ];
    return ListView.separated(
        itemCount: stories.length,
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              locator<NavigationService>().navigateToStoryView();
            },
            child: Container(
              width: 162.w,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(stories[index]), fit: BoxFit.fill),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter your text here",
                    style: TextStyle(
                      fontSize: 25.sp,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 15.w);
        });
  }
}
