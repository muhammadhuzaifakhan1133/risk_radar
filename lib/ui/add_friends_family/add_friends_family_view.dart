import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/ui/add_friends_family/add_friends_family_viewmodel.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:risk_radar/widgets/custom_button.dart';
import 'package:risk_radar/widgets/custom_textfield.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddFriendsFamilyView extends StatelessWidget {
  const AddFriendsFamilyView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => AddFriendsFamilyViewModel(),
        builder: (context, viewModel, child) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                icon: const Icon(Icons.arrow_back),
                                onPressed: () {
                                  locator<NavigationService>().back();
                                }),
                            const SizedBox(width: 10),
                            Text(
                              "Add Friends & Family",
                              style: TextStyle(fontSize: 19.sp),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Enter Details",
                              style: TextStyle(fontSize: 20.sp),
                            )),
                        const SizedBox(height: 15),
                        CustomTextField(
                          hintText: "Name",
                          controller: viewModel.nameController,
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 15),
                        CustomTextField(
                          hintText: "Phone Number",
                          controller: viewModel.phoneController,
                          prefixIcon: const Icon(
                            Icons.call,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 15),
                        CustomTextField(
                          hintText: "Email (Optional)",
                          controller: viewModel.emailController,
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                for (var item in viewModel.selected.keys) {
                                  viewModel.selected[item] = false;
                                }
                                viewModel.selected["Family"] = true;
                                viewModel.notifyListeners();
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(
                                      viewModel.selected["Family"]!
                                          ? 0.9
                                          : 0.4),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Center(
                                        child: Text("Family",
                                            style: TextStyle(fontSize: 15.sp))),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 10.0),
                                      child: Icon(
                                        Icons.family_restroom,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                            const SizedBox(width: 20),
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                for (var item in viewModel.selected.keys) {
                                  viewModel.selected[item] = false;
                                }
                                viewModel.selected["Friend"] = true;
                                viewModel.notifyListeners();
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(
                                      viewModel.selected["Friend"]!
                                          ? 0.9
                                          : 0.4),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Center(
                                        child: Text("Friend",
                                            style: TextStyle(fontSize: 15.sp))),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Icon(
                                        Icons.group,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                          ],
                        ),
                        const SizedBox(height: 15),
                        CustomButton(
                          title: "Save",
                          radius: 15,
                          fontSize: 20.sp,
                          fontColor: Colors.black,
                          bgColor: Colors.white.withOpacity(0.4),
                          onPressed: () {},
                        ),
                        const SizedBox(height: 15),
                        CustomButton(
                          title: "Cancel",
                          radius: 15,
                          fontSize: 20.sp,
                          fontColor: Colors.black,
                          bgColor: Colors.white.withOpacity(0.4),
                          onPressed: () {
                            locator<NavigationService>().back();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
