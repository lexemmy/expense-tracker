import 'package:expense_tracker/src/views/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnboardingController extends GetxController {
  int _currentIndex = 0;
  final int _numPages = 3;
  PageController _pageController;

  int get currentIndex => _currentIndex;
  int get numPages => _numPages;
  PageController get pageController => _pageController;

  @override
  void onInit() {
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    _pageController.dispose();
    super.onClose();
  }

  void onChangedFunction(int index) {
    _currentIndex = index;
    update();
  }

  void signUp() async {
    Get.to(SigninScreen());
  }
}
