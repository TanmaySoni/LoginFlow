import 'package:flutter/material.dart';
import 'package:login_flow/serializer/user.dart';

class SignUpModel with ChangeNotifier {
  bool isLoading = false;
  bool buttonLoader = false;
  String email;
  String phoneNumber;
  User user = User();
  SignUpModel();

  setEmail(String value) {
    email = value;
    notifyListeners();
  }

  setPhoneNumber(String value) {
    phoneNumber = value;
    notifyListeners();
  }

  setButtonLoader(bool value) {
    buttonLoader = value;
    notifyListeners();
  }

  setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
