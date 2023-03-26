import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/ui/story/story_viewmodel.dart';
import 'package:risk_radar/widgets/story_tag.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:risk_radar/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StoryView extends StatelessWidget {
  const StoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => StoryViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Container(
            width: context.width,
            height: context.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                scale: 0.95,
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                storyTag("Earthquake"),
                                const SizedBox(width: 10),
                                storyTag("Turkey"),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Image.asset(ImageConstants.storyProfile),
                                const SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Anna Foster",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      "The Geysers, CA",
                                      style: TextStyle(
                                          color: Color(0xff626060),
                                          fontSize: 12),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ListView.builder(
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount:
                                          viewModel.storyDescription.length,
                                      itemBuilder: (context, index) {
                                        return Text(
                                          viewModel.storyDescription[index],
                                          style: TextStyle(
                                              fontSize: index == 0 ? 23 : 15,
                                              color: index == 0
                                                  ? Colors.black
                                                  : Color(0xff2F2E2E)),
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Don't forget to like.",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        Row(
                                          children: [
                                            Text("128 Likes"),
                                            const SizedBox(width: 10),
                                            IconButton(
                                                onPressed: () {
                                                  viewModel.like();
                                                },
                                                icon: Icon(
                                                    viewModel.isFavorite
                                                        ? Icons.favorite
                                                        : Icons.favorite_border,
                                                    size: 30)),
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    CustomButton(
                                      title: "Share your own story",
                                      fontSize: 19,
                                      onPressed: () {},
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ))),
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
