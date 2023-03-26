import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:risk_radar/ui/news/news_viewmodel.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => NewsViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            width: context.width,
            height: context.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstants.background5),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppBar(
                      leading: IconButton(
                        onPressed: () {
                          locator<NavigationService>().back();
                        },
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.black),
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: const Text(
                        'Google News',
                        style: TextStyle(color: Colors.black, fontSize: 23),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Image.asset(ImageConstants.news),
                    const SizedBox(height: 20),
                    const Text("Turkey hit by a 3.8 magnitude Earthquake",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23)),
                    const SizedBox(height: 10),
                    Text(
                      viewModel.newsDescription,
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.5,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Don't forget to like.",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Text("128 Likes"),
                            const SizedBox(width: 10),
                            IconButton(
                                onPressed: () {
                                  viewModel.like();
                                },
                                icon: Icon(
                                    viewModel.isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: 30))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
