import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
                            Text(
                              "Help the people in Turkey recover from earthquakes",
                              style: TextStyle(fontSize: 23),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
                                    Text.rich(TextSpan(
                                        text: "Organized by ",
                                        style: TextStyle(fontSize: 15),
                                        children: [
                                          TextSpan(
                                              text: "Eye on Turkey",
                                              style: TextStyle(
                                                  color: Color(0xff8C3283),
                                                  fontSize: 15))
                                        ])),
                                    SizedBox(width: 5),
                                    Icon(Icons.check_circle,
                                        color: Color(0xff8C3283))
                                  ],
                                ),
                                const Text(
                                  "50 days left",
                                  style: TextStyle(
                                      color: Color(0xff7D777D), fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            LinearProgressIndicator(
                              value: 0.5,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xff8C3283)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Raised amount",
                                  style: TextStyle(
                                      color: Color(0xff958B8C), fontSize: 15),
                                ),
                                Text(
                                  "Target",
                                  style: TextStyle(
                                      color: Color(0xff958B8C), fontSize: 15),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text.rich(TextSpan(
                                    text: "\$500.25 ",
                                    style: TextStyle(fontSize: 15),
                                    children: [
                                      TextSpan(
                                        text: "(50)",
                                        style: TextStyle(
                                            color: Color(0xff958B8C),
                                            fontSize: 15),
                                      )
                                    ])),
                                Text(
                                  "\$1000",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Recent Donors",
                                        style: TextStyle(
                                            color: Color(0xff958B8C),
                                            fontSize: 15),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        for (String donor in viewModel.donors)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15.0),
                                            child: CircleAvatar(
                                              radius: 25,
                                              backgroundImage:
                                                  AssetImage(donor),
                                            ),
                                          ),
                                        CircleAvatar(
                                          backgroundColor: Color(0xff97488F),
                                          radius: 25,
                                          child: Center(
                                              child: Text(
                                            "10+",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          )),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "More about us:",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    ListView.builder(
                                      itemCount: viewModel.description.length,
                                      shrinkWrap: true,
                                      primary: false,
                                      itemBuilder: (context, index) {
                                        return Text(
                                            viewModel.description[index],
                                            style: TextStyle(fontSize: 15));
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
                      width: 120,
                      height: 40,
                      bgColor: Colors.black.withOpacity(0.6),
                      fontSize: 18,
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
