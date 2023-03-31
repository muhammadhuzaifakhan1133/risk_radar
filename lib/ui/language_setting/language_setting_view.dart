import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/ui/language_setting/language_setting_viewmodel.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:stacked/stacked.dart';

class LanguageSettingView extends StatelessWidget {
  const LanguageSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => LanguageSettingViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              width: context.width,
              height: context.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstants.background7),
                  fit: BoxFit.fill,
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
                        SizedBox(width: 27.w),
                        Text(
                          "Language Setting",
                          style: TextStyle(fontSize: 23.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 29.h),
                    Expanded(
                      child: ListView.separated(
                          itemCount: viewModel.languages.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 10.h);
                          },
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                viewModel.selectLanguage(index);
                              },
                              child: Container(
                                width: 344.w,
                                height: 60.h,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(
                                      viewModel.languages[index].isSelected
                                          ? 0.8
                                          : 0.4),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 35.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      viewModel.languages[index].name,
                                      style: TextStyle(fontSize: 23.sp),
                                    ),
                                    if (viewModel.languages[index].isSelected)
                                      const Icon(
                                        Icons.check,
                                        color: Colors.black,
                                      )
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
