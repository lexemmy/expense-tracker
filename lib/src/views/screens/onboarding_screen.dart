import 'package:expense_tracker/src/views/widget/app_button.dart';
import 'package:expense_tracker/src/views/widget/onboard_column.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controller/onboarding_controller.dart';
import '../../core/constants.dart';
import '../../core/images.dart';

class OnboardingScreen extends StatelessWidget {
  List<Widget> _buildPageIndicator(OnboardingController controller) {
    List<Widget> list = [];
    for (int i = 0; i < controller.numPages; i++) {
      list.add(
          i == controller.currentIndex ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 12.0,
      width: 12.0,
      decoration: BoxDecoration(
        color: isActive ? kPrimaryColor : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: kPrimaryColor),
      ),
    );
  }

  final List<OnboardColumn> onboardingPages = <OnboardColumn>[
    OnboardColumn(
        imgPath: onboarding1,
        titletext:'Set a budget ',
             
        ),
    OnboardColumn(
        imgPath: onboarding2,
        titletext:'Track your Expenses',
             
        ),
    OnboardColumn(
        imgPath: onboarding3,
        titletext:'Grow your savings ',
             
        )
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: GetBuilder<OnboardingController>(
          init: OnboardingController(),
          builder: (controller) => Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: controller.pageController,
                    onPageChanged: controller.onChangedFunction,
                    children: onboardingPages,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 40),  
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildPageIndicator(controller),
                      ),
                      Spacer(),
                     controller.currentIndex == onboardingPages.length - 1
                      ? 
                      AppButton(
                        label: "Get Started",
                        color: kPrimaryColor,
                        onPressed: controller.signUp,
                      ):
                      RichText(
                      text:TextSpan(
                        text: 'Skip',
                      recognizer: TapGestureRecognizer()..onTap = () => controller.signUp(),            
                        style: kTextStyle,
                      )
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
  }
}
