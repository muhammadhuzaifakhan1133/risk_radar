import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:risk_radar/ui/navigation_bar/navigation_bar_viewmodel.dart';
import 'package:stacked/stacked.dart';

class NavigationBarView extends StatelessWidget {
  const NavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => NavigationBarViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            extendBody: true,
            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              color: Colors.black,
              index: viewModel.currentIndex,
              items: [
                Icon(Icons.home,
                    size: 35,
                    color: viewModel.currentIndex == 0
                        ? Color(0xffD596EB)
                        : Colors.white),
                Icon(Icons.people,
                    size: 35,
                    color: viewModel.currentIndex == 1
                        ? Color(0xffD596EB)
                        : Colors.white),
                Icon(Icons.notifications,
                    size: 35,
                    color: viewModel.currentIndex == 2
                        ? Color(0xffD596EB)
                        : Colors.white),
              ],
              onTap: (index) {
                viewModel.currentIndex = index;
                viewModel.notifyListeners();
              },
            ),
            body: viewModel.screens[viewModel.currentIndex],
          );
        });
  }
}
