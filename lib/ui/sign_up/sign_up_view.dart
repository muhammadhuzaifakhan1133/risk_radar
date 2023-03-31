import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                        SizedBox(
                          width: context.width,
                          height: context.height,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 181.h),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Create New Account",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(height: 34.h),
                                CustomTextField(
                                  hintText: "Name",
                                  controller: viewModel.nameController,
                                ),
                                SizedBox(height: 22.h),
                                CustomTextField(
                                  hintText: "Phone Number",
                                  controller: viewModel.phoneController,
                                ),
                                SizedBox(height: 22.h),
                                CustomTextField(
                                  hintText: "Email",
                                  controller: viewModel.emailController,
                                ),
                                SizedBox(height: 22.h),
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
                                    onPressed:
                                        viewModel.togglePasswordVisibility,
                                  ),
                                ),
                                SizedBox(height: 26.h),
                                Row(
                                  children: [
                                    Checkbox(
                                        value: viewModel.agree,
                                        onChanged: viewModel.toggleAgree),
                                    SizedBox(width: 11.w),
                                    Text.rich(
                                      TextSpan(
                                        text: "I agree with ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 19.sp),
                                        children: [
                                          TextSpan(
                                            text: "Terms & Condition",
                                            style: TextStyle(
                                                color: Color(0xff5F6DC9),
                                                fontSize: 19.sp,
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
                                SizedBox(height: 25.h),
                                CustomButton(
                                    title: "Create Account",
                                    onPressed: viewModel.signUp),
                                SizedBox(height: 116.h),
                                Text.rich(TextSpan(
                                    text: "Already have an account? ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(
                                          text: "Sign In",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.bold),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              viewModel.navigateToSignIn();
                                            })
                                    ]))
                              ],
                            ),
                          ),
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
