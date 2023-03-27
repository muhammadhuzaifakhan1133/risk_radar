import 'package:flutter/material.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/app/app.router.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/widgets/custom_textfield.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeSearchBar extends StatelessWidget {
  final TextEditingController searchController;
  const HomeSearchBar({
    super.key,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: CustomTextField(
          hintText: "Search for blogs, charities",
          controller: searchController,
          height: 40,
          borderRadius: 20,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          filledColor: const Color(0xffD9D9D9),
          hintTextColor: const Color(0xff706767),
          hintFontSize: 15,
          suffixIcon: const Icon(Icons.search),
        ),
      ),
      const SizedBox(width: 25),
      Stack(
        children: [
          InkWell(
            onTap: () {
              locator<NavigationService>().navigateToProfileView();
            },
            child: CircleAvatar(
              radius: 23,
              backgroundImage: AssetImage(ImageConstants.profile),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: 15,
              width: 15,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 168, 235, 92),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      )
    ]);
  }
}
