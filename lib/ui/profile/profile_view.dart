import 'package:flutter/material.dart';
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
                      style: TextStyle(color: Colors.black, fontSize: 19),
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
                          icon: Icon(
                            Icons.settings,
                            color: Colors.black,
                          ))
                    ],
                  ),
                  const SizedBox(height: 20),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(ImageConstants.profile),
                  ),
                  const SizedBox(height: 10),
                  Text("Eva Zu Beck",
                      style: TextStyle(
                        color: Color(0xff413C3C),
                        fontSize: 19,
                      )),
                  const SizedBox(height: 5),
                  Text(
                    "Birmingham, UK",
                    style: TextStyle(color: Color(0xff626060), fontSize: 12),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: context.width * 0.9,
                    height: context.height * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "A little bit about me:",
                            style: TextStyle(
                                color: Color(0xff413C3C), fontSize: 19),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Hi! I am Eva and I’m a survivor of the Earthquake of 2.8 magnitude",
                            style: TextStyle(
                                color: Color(0xff626060), fontSize: 14),
                          ),
                          const SizedBox(height: 10),
                          Divider(thickness: 2),
                          const SizedBox(height: 10),
                          Text(
                            "Donations made:",
                            style: TextStyle(
                                color: Color(0xff413C3C), fontSize: 19),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: 125,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 10),
                                Image.asset(ImageConstants.donationIcon),
                                const SizedBox(width: 10),
                                Text(
                                  "\$500",
                                  style: TextStyle(
                                      color: Color(0xff626060), fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Divider(thickness: 2),
                          const SizedBox(height: 10),
                          // ignore: prefer_const_constructors
                          Text(
                            "My Friends & Family:",
                            style: TextStyle(
                                color: Color(0xff413C3C), fontSize: 19),
                          ),
                          const SizedBox(height: 15),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (String people in viewModel.peoples)
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(people),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                const SizedBox(width: 10),
                                Text(
                                  "See more...",
                                  style: TextStyle(
                                      color: Color(0xff626060), fontSize: 12),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Divider(thickness: 2),
                          const SizedBox(height: 10),
                          Text(
                            "Badges earned:",
                            style: TextStyle(
                                color: Color(0xff413C3C), fontSize: 19),
                          ),
                          const SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (String badge in viewModel.badges)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Image.asset(badge),
                                  )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Divider(thickness: 2),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
