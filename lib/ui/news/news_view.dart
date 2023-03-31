import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                      title:  Text(
                        'Google News',
                        style: TextStyle(color: Colors.black, fontSize: 23.sp),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    Image.asset(
                      ImageConstants.news,
                      width: 346.w,
                      height: 190.h,
                    ),
                    SizedBox(height: 14.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                           Text("Turkey hit by a 3.8 magnitude Earthquake",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 23.sp)),
                          SizedBox(height: 10.h),
                          Text(
                            viewModel.newsDescription,
                            style:  TextStyle(
                              fontSize: 15.sp,
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text("Don't forget to like.",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  const Text("128 Likes"),
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
