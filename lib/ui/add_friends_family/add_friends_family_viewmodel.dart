import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AddFriendsFamilyViewModel extends BaseViewModel {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  Map<String, bool> selected = {
    'Family': true,
    'Friend': false,
  };
}
