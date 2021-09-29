import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../views/screens/onboarding_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    decideNavigation();
    super.onInit();
  }

  void decideNavigation() async {
    await Future.delayed(Duration(seconds: 3));

      Get.off(OnboardingScreen());
  
}
}
