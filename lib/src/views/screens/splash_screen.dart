import 'package:expense_tracker/src/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../controller/splash_controller.dart';
import '../../core/images.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) => Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(logo1),
              SizedBox(height: 16.0),
              Text(
                "TrakFundz",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              SpinKitRipple(color: Color(0xFF81007F))
            ],
          ),
        ),
      ),
    );
  }
}
