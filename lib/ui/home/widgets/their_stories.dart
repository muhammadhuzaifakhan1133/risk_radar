import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
      ImageConstants.storiesBg1,
    ];
    return ListView.separated(
        itemCount: 3,
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              locator<NavigationService>().navigateToStoryView();
            },
            child: Container(
              width: context.width * 0.4,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(stories[index]), fit: BoxFit.fill),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Enter your text here",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10);
        });
  }
}
