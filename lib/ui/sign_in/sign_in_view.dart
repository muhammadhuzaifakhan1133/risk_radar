import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
          return Scaffold(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Sign In",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: viewModel.emailController,
                  hintText: "Phone Number or Email",
                ),
                const SizedBox(height: 15),
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
                const SizedBox(height: 30),
                CustomButton(title: "Sign in", onPressed: () {}),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: (){
                    viewModel.navigateToForgotPassword();
                  },
                  child: const Text("Forgot Password?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 30),
                Row(children: const [
                  Expanded(child: Divider(thickness: 2)),
                  Text(" OR ", style: TextStyle(fontSize: 17)),
                  Expanded(child: Divider(thickness: 2)),
                ]),
                const SizedBox(height: 30),
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
                        Image.asset(ImageConstants.googleLogo),
                        const SizedBox(width: 15),
                        const Text("Continue with Google",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 21,
                                fontWeight: FontWeight.bold)),
                      ],
                    )),
                const SizedBox(height: 15),
                Text.rich(TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: "Sign Up",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              viewModel.navigateToSignUp();
                            })
                    ]))
              ],
            ),
          ));
        });
  }
}
