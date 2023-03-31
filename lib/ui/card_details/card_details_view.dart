import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/ui/card_details/card_details_viewmodel.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:risk_radar/widgets/custom_button.dart';
import 'package:risk_radar/widgets/custom_textfield.dart';
import 'package:stacked/stacked.dart';

class CardDetailsView extends StatelessWidget {
  const CardDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => CardDetailsViewModel(),
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
                    child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              viewModel.back();
                            },
                            icon: const Icon(Icons.arrow_back_ios)),
                        const SizedBox(width: 10),
                         Text(
                          "Card Details",
                          style: TextStyle(fontSize: 23.sp),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: context.height * 0.1),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Card Number",
                                style: TextStyle(fontSize: 18.sp),
                              ),
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              hintText: "0000 0000 0000 0000",
                              suffixIcon: Icon(
                                Icons.credit_card,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        "Expiry Date",
                                        style: TextStyle(fontSize: 18.sp),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    CustomTextField(
                                      width: context.width * 0.4,
                                      hintText: "MM/YY",
                                      suffixIcon: Icon(
                                        Icons.calendar_today,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        "CVC/CVV",
                                        style: TextStyle(fontSize: 18.sp),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    CustomTextField(
                                      width: context.width * 0.4,
                                      hintText: "***",
                                      suffixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Cardholder Name",
                                style: TextStyle(fontSize: 18.sp),
                              ),
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              hintText: "Enter Cardholder's Name",
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Checkbox(
                                    value: viewModel.saveCard,
                                    onChanged: (value) {
                                      viewModel.saveCard = value as bool;
                                      viewModel.notifyListeners();
                                    }),
                                const SizedBox(width: 10),
                                Text(
                                  "Save Card",
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            CustomButton(title: "Add Card", onPressed: () {})
                          ],
                        ),
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
