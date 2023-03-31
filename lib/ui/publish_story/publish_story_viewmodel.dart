import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:risk_radar/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PublishStoryViewModel extends BaseViewModel {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController tagsController = TextEditingController();
  List<String> tags = [];
  void back() {
    locator<NavigationService>().back();
  }

  File? image;

  Future<void> addImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      image = File(file.path);
      notifyListeners();
    }
  }

  void addTag() {
    if (tagsController.text.isNotEmpty) {
      tags.add(tagsController.text);
      tagsController.clear();
      notifyListeners();
    }
  }

  void removeTag(int index) {
    tags.removeAt(index);
    notifyListeners();
  }
}
