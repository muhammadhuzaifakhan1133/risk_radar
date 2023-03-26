import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/app/app.router.dart';
import 'package:risk_radar/ui/forget_password/forget_password_viewmodel.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:risk_radar/widgets/custom_button.dart';
import 'package:risk_radar/widgets/custom_textfield.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => ForgetPasswordViewModel(),
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
                    child: Center(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        child: IconButton(
                            onPressed: () {
                              locator<NavigationService>().back();
                            },
                            icon: const Icon(Icons.arrow_back_ios)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Forget Password",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                              "Enter your email address to get the recovery code to get back into your account. ",
                              style: TextStyle(
                                  color: Color(0xff454242), fontSize: 20)),
                          const SizedBox(height: 15),
                          CustomTextField(
                            controller: viewModel.emailController,
                            hintText: "Enter Email Address",
                          ),
                          const SizedBox(height: 20),
                          CustomButton(
                              title: "Get Code",
                              onPressed: () {
                                viewModel.navigateToVerifyUserView();
                              }),
                          const SizedBox(height: 27),
                          Row(children: const [
                            Expanded(child: Divider(thickness: 2)),
                            Text(" OR ", style: TextStyle(fontSize: 17)),
                            Expanded(child: Divider(thickness: 2)),
                          ]),
                          const SizedBox(height: 27),
                          GestureDetector(
                            onTap: () {
                              locator<NavigationService>()
                                  .navigateToSignUpView();
                            },
                            child: const Text("Create New Account",
                                style: TextStyle(fontSize: 25)),
                          )
                        ],
                      )
                    ],
                  ),
                )),
              ),
            ),
          );
        });
  }
}
