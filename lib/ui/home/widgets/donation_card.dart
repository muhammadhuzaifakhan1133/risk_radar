import 'package:flutter/material.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/app/app.router.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:risk_radar/widgets/custom_button.dart';
import 'package:stacked_services/stacked_services.dart';

class DonationCard extends StatelessWidget {
  const DonationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          locator<NavigationService>().navigateToDonationView();
        },
        child: SizedBox(
          height: 204,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 154,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white.withOpacity(0.4),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 10,
                    child: CustomButton(
                        title: "Donate Now",
                        height: 27,
                        width: context.width * 0.21,
                        fontSize: 10,
                        onPressed: () {
                          locator<NavigationService>().navigateToDonateView();
                        }),
                  )
                ],
              ),
              const SizedBox(height: 5),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Insert text here", style: TextStyle(fontSize: 12)),
              ),
              const SizedBox(height: 5),
              const LinearProgressIndicator(
                  value: 0.5,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black)),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Total raised",
                      style: TextStyle(fontSize: 12, color: Color(0xff676161))),
                  Text.rich(
                    TextSpan(
                      text: "\$454,879",
                      style: TextStyle(fontSize: 12),
                      children: [
                        TextSpan(
                          text: "(50%)",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff676161)),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
