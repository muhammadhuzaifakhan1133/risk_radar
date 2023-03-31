import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/ui/verify_user/verify_user_viewmodel.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:risk_radar/widgets/custom_button.dart';
import 'package:risk_radar/widgets/custom_textfield.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class VerifyUserView extends StatelessWidget {
  const VerifyUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => VerifyUserViewModel(),
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
                              SizedBox(height: 250.h),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Verify Yourself",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(height: 20.h),
                              Text(
                                  "Enter the verification code that you have just received.",
                                  style: TextStyle(
                                      color: const Color(0xff454242),
                                      fontSize: 20.sp)),
                              SizedBox(height: 20.h),
                              CustomTextField(
                                controller: viewModel.codeController,
                                hintText: "Enter Code",
                              ),
                              SizedBox(height: 25.h),
                              CustomButton(
                                  title: "Verify",
                                  onPressed: () {
                                    viewModel.navigateToResetPassword();
                                  }),
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
