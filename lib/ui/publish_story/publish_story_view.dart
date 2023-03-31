import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:risk_radar/ui/publish_story/publish_story_viewmodel.dart';
import 'package:risk_radar/utils/image_constants.dart';
import 'package:risk_radar/utils/size_extension.dart';
import 'package:risk_radar/widgets/custom_button.dart';
import 'package:risk_radar/widgets/custom_textfield.dart';
import 'package:stacked/stacked.dart';

class PublishStoryView extends StatelessWidget {
  const PublishStoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => PublishStoryViewModel(),
      builder: (context, viewModel, child) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              width: context.width,
              height: context.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstants.background6),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 13.42.w),
                          IconButton(
                              onPressed: () {
                                viewModel.back();
                              },
                              icon: const Icon(Icons.arrow_back_ios)),
                          SizedBox(width: 27.73.w),
                          Text(
                            "Publish Your Story",
                            style: TextStyle(fontSize: 23.sp),
                          ),
                        ],
                      ),
                      SizedBox(height: 38.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Title",
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      CustomTextField(
                        controller: viewModel.titleController,
                        hintText: "Enter title",
                        width: 360.w,
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Image",
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      InkWell(
                        onTap: () {
                          viewModel.addImage();
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: 120.h,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(10),
                              image: viewModel.image != null
                                  ? DecorationImage(
                                      fit: BoxFit.fill,
                                      image: FileImage(viewModel.image!))
                                  : null),
                          child: viewModel.image == null
                              ? const Center(
                                  child: Icon(Icons.add_a_photo_outlined),
                                )
                              : null,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Description",
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      CustomTextField(
                        controller: viewModel.descriptionController,
                        hintText: "Enter description",
                        width: 360.w,
                        maxLines: 5,
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Tags",
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          CustomTextField(
                            controller: viewModel.tagsController,
                            hintText: "Enter tags",
                            width: 360.w,
                          ),
                          CustomButton(
                            title: "Add",
                            radius: 10,
                            fontSize: 16.sp,
                            width: 80.w,
                            onPressed: () {
                              viewModel.addTag();
                            },
                          )
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Wrap(
                        children: [
                          for (int index = 0;
                              index < viewModel.tags.length;
                              index++)
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              margin:
                                  EdgeInsets.only(right: 10.w, bottom: 10.h),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: InkWell(
                                onTap: () {
                                  viewModel.removeTag(index);
                                },
                                child: Text(
                                  viewModel.tags[index],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14.sp),
                                ),
                              ),
                            )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
