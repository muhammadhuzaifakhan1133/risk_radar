import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/app/app.router.dart';
import 'package:risk_radar/ui/reset_password/reset_password_viewmodel.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:risk_radar/widgets/custom_button.dart';
import 'package:risk_radar/widgets/custom_textfield.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => ResetPasswordViewModel(),
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
                    image: AssetImage(ImageConstants.background8),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SafeArea(
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
                      child: Column(
                        children: [
                          SizedBox(height: 225.h),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Reset Password",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: 30.h),
                          CustomTextField(
                            hintText: "New Password *",
                            controller: viewModel.newPasswordController,
                            obscureText: viewModel.obscureTextNewPassword,
                            suffixIcon: IconButton(
                              icon: Icon(
                                viewModel.obscureTextNewPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: viewModel.toggleNewPasswordVisibility,
                            ),
                          ),
                          SizedBox(height: 22.h),
                          CustomTextField(
                            hintText: "Confirm Password *",
                            controller: viewModel.confirmPasswordController,
                            obscureText: viewModel.obscureTextConfirmPassword,
                            suffixIcon: IconButton(
                              icon: Icon(
                                viewModel.obscureTextConfirmPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed:
                                  viewModel.toggleConfirmPasswordVisibility,
                            ),
                          ),
                          SizedBox(height: 25.h),
                          CustomButton(
                              title: "Reset",
                              onPressed: () {
                                locator<NavigationService>()
                                    .pushNamedAndRemoveUntil(Routes.signInView);
                              }),
                        ],
                      ),
                    )
                  ],
                )),
              ),
            ),
          );
        });
  }
}
