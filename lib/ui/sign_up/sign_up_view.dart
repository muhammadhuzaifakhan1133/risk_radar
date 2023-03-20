import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/ui/sign_up/sign_up_viewmodel.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:risk_radar/widgets/custom_button.dart';
import 'package:risk_radar/widgets/custom_textfield.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => SignUpViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              width: context.width,
              height: context.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstants.background4),
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
                            child: Text("Create New Account",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 30),
                          CustomTextField(
                            hintText: "Name",
                            controller: viewModel.nameController,
                          ),
                          const SizedBox(height: 15),
                          CustomTextField(
                            hintText: "Phone Number",
                            controller: viewModel.phoneController,
                          ),
                          const SizedBox(height: 15),
                          CustomTextField(
                            hintText: "Email",
                            controller: viewModel.emailController,
                          ),
                          const SizedBox(height: 15),
                          CustomTextField(
                            hintText: "Password",
                            controller: viewModel.passwordController,
                            obscureText: viewModel.obscureText,
                            suffixIcon: IconButton(
                              icon: Icon(
                                viewModel.obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.black,
                              ),
                              onPressed: viewModel.togglePasswordVisibility,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Checkbox(
                                  value: viewModel.agree,
                                  onChanged: viewModel.toggleAgree),
                              const SizedBox(width: 10),
                              Text.rich(
                                TextSpan(
                                  text: "I agree with ",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 19),
                                  children: [
                                    TextSpan(
                                      text: "Terms & Condition",
                                      style: const TextStyle(
                                          color: Color(0xff5F6DC9),
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          print("Terms & Condition");
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          CustomButton(
                              title: "Create Account",
                              onPressed: viewModel.signUp),
                          const SizedBox(height: 15),
                          Text.rich(TextSpan(
                              text: "Already have an account? ",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                    text: "Sign In",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        viewModel.navigateToSignIn();
                                      })
                              ]))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
