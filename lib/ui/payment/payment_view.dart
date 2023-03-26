import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/ui/payment/payment_viewmodel.dart';
import 'package:risk_radar/ui/payment/widgets/payment_card.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PaymentViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
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
                        "Payment",
                        style: TextStyle(fontSize: 23),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: context.width * 0.8,
                    height: 70,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Amount:",
                          style:
                              TextStyle(color: Color(0xff706767), fontSize: 22),
                        ),
                        Text(
                          "\$500",
                          style: TextStyle(fontSize: 22),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text(
                        "Pay with",
                        style:
                            TextStyle(color: Color(0xff706767), fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  paymentCard(context,
                      cardIcon: ImageConstants.visaIcon,
                      cardType: "Visa Pay",
                      isSelected: viewModel.selected["Visa"]!, onTap: () {
                    for (var key in viewModel.selected.keys) {
                      viewModel.selected[key] = false;
                    }
                    viewModel.selected["Visa"] = true;
                    viewModel.notifyListeners();
                  }),
                  const SizedBox(height: 10),
                  paymentCard(context,
                      cardIcon: ImageConstants.masterCardIcon,
                      cardType: "Master Card",
                      isSelected: viewModel.selected["Master"]!, onTap: () {
                    for (var key in viewModel.selected.keys) {
                      viewModel.selected[key] = false;
                    }
                    viewModel.selected["Master"] = true;
                    viewModel.notifyListeners();
                  }),
                  const SizedBox(height: 10),
                  paymentCard(context,
                      cardIcon: ImageConstants.paypalIcon,
                      cardType: "Paypal",
                      isSelected: viewModel.selected["Paypal"]!, onTap: () {
                    for (var key in viewModel.selected.keys) {
                      viewModel.selected[key] = false;
                    }
                    viewModel.selected["Paypal"] = true;
                    viewModel.notifyListeners();
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
