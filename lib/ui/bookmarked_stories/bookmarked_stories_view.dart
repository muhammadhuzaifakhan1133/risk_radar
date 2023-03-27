import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:risk_radar/ui/alert_setting/alert_setting_viewmodel.dart';
import 'package:risk_radar/ui/bookmarked_charities/bookmarked_charities_viewmodel.dart';
import 'package:risk_radar/ui/bookmarked_stories/bookmarked_stories_viewmodel.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:stacked/stacked.dart';

class BookmarkedStoriesView extends StatelessWidget {
  const BookmarkedStoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => BookmarkedStoriesViewModel(),
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
                        "Bookmarked Stories",
                        style: TextStyle(fontSize: 23),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GridView.builder(
                      itemCount: 12,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return Container(
                          width: context.width * 0.4,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(10)),
                        );
                      },
                    ),
                  )
                ],
              )),
            ),
          );
        });
  }
}
