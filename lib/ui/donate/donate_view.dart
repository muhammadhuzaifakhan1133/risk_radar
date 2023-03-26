import 'package:flutter/material.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/app/app.router.dart';
import 'package:risk_radar/ui/donate/donate_viewmodel.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:risk_radar/widgets/custom_button.dart';
import 'package:risk_radar/widgets/custom_textfield.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DonateView extends StatelessWidget {
  const DonateView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => DonateViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
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
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            locator<NavigationService>().back();
                          },
                          icon: const Icon(Icons.arrow_back_ios)),
                      const SizedBox(width: 10),
                      const Text(
                        "Donate Now",
                        style: TextStyle(fontSize: 23),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Image.asset(ImageConstants.donate),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text.rich(TextSpan(
                              text: "Organized by ",
                              style: TextStyle(fontSize: 15),
                              children: [
                                TextSpan(
                                    text: "Eye on Turkey",
                                    style: TextStyle(
                                        color: Color(0xff8C3283), fontSize: 15))
                              ])),
                          SizedBox(width: 5),
                          Icon(Icons.check_circle, color: Color(0xff8C3283))
                        ],
                      ),
                      const Text(
                        "50 days left",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Donate to help Turkey recover",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  const CustomTextField(
                    hintText: "Enter Amount",
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                      title: "Donate Now",
                      onPressed: () {
                        locator<NavigationService>().navigateToPaymentView();
                      })
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
