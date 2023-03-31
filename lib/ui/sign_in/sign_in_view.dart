import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/ui/sign_in/sign_in_viewmodel.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:risk_radar/widgets/custom_button.dart';
import 'package:risk_radar/widgets/custom_textfield.dart';
import 'package:stacked/stacked.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => SignInViewModel(),
        builder: (context, viewModel, child) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
                body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              width: context.width,
              height: context.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstants.background3),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 162.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Sign In",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 30.h),
                    CustomTextField(
                      controller: viewModel.emailController,
                      hintText: "Phone Number or Email",
                    ),
                    SizedBox(height: 22.h),
                    CustomTextField(
                      controller: viewModel.passwordController,
                      hintText: "Password",
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
                    SizedBox(height: 34.h),
                    CustomButton(
                        title: "Sign in", onPressed: viewModel.navigateToHome),
                    SizedBox(height: 30.23.h),
                    GestureDetector(
                      onTap: () {
                        viewModel.navigateToForgotPassword();
                      },
                      child: Text("Forgot Password?",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 26.h),
                    Row(children: [
                      const Expanded(child: Divider(thickness: 2)),
                      Text(" OR ", style: TextStyle(fontSize: 17.sp)),
                      const Expanded(child: Divider(thickness: 2)),
                    ]),
                    SizedBox(height: 33.h),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.5),
                          fixedSize: Size(context.width * 0.8, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImageConstants.googleLogo,
                              height: 15.h,
                              width: 15.w,
                            ),
                            const SizedBox(width: 15),
                            Text("Continue with Google",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 21.sp,
                                    fontWeight: FontWeight.bold)),
                          ],
                        )),
                    SizedBox(height: 145.h),
                    Text.rich(TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                              text: "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  viewModel.navigateToSignUp();
                                })
                        ]))
                  ],
                ),
              ),
            )),
          );
        });
  }
}
