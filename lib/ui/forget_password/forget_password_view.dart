import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                      SizedBox(
                        width: context.width,
                        height: context.height,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 180.h),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Forget Password",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(height: 19.h),
                              Text(
                                  "Enter your email address to get the recovery code to get back into your account. ",
                                  style: TextStyle(
                                      color: const Color(0xff454242),
                                      fontSize: 20.sp)),
                              SizedBox(height: 16.h),
                              CustomTextField(
                                controller: viewModel.emailController,
                                hintText: "Enter Email Address",
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                "Or",
                                style: TextStyle(
                                    color: const Color(0xff111946),
                                    fontSize: 17.sp),
                              ),
                              SizedBox(height: 12.h),
                              CustomTextField(
                                controller: viewModel.emailController,
                                hintText: "Enter Phone Number",
                              ),
                              SizedBox(height: 25.h),
                              CustomButton(
                                  title: "Get Code",
                                  onPressed: () {
                                    viewModel.navigateToVerifyUserView();
                                  }),
                              SizedBox(height: 25.h),
                              Row(children: [
                                const Expanded(child: Divider(thickness: 2)),
                                Text(" OR ", style: TextStyle(fontSize: 17.sp)),
                                const Expanded(child: Divider(thickness: 2)),
                              ]),
                              SizedBox(height: 18.h),
                              GestureDetector(
                                onTap: () {
                                  locator<NavigationService>()
                                      .navigateToSignUpView();
                                },
                                child: Text("Create New Account",
                                    style: TextStyle(fontSize: 25.sp)),
                              )
                            ],
                          ),
                        ),
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
