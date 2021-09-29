import 'package:expense_tracker/src/core/constants.dart';
import 'package:expense_tracker/src/core/images.dart';
import 'package:expense_tracker/src/core/notifier.dart';
import 'package:expense_tracker/src/views/widget/app_button.dart';
import 'package:expense_tracker/src/views/widget/app_textfield.dart';
import 'package:expense_tracker/src/views/widget/transparent_statusbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/signin_controller.dart';

class SigninScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TransparentStatusbar(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GetBuilder<SigninController>(
            init: SigninController(),
            builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    kExtraLargeVerticalSpacing,
                    header,
                    kLargeVerticalSpacing,
                    form(controller),
                    kMediumVerticalSpacing,
                    dontHaveAccount(controller),
                    kMediumVerticalSpacing,
                  ],
                ),
              ),
            ),
          ),
        ),
      ));
  }


  Widget get header => Column(
        children: [
          Image.asset(
            logo2,
            width: 200.0,
          ),
          kMediumVerticalSpacing,
        ],
      );

  Widget form(SigninController controller) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            hintText: 'Email',
            onSaved: (input) => controller.email = input,
            suffixIcon: Icon(Icons.mail,
            color: Color(0xFF810180),),
            controller: controller.emailAddressController,
            validator: controller.validateEmail,
          ),
          kMediumVerticalSpacing,
          AppTextField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            hintText: 'Password',
            onSaved: (input) => controller.password = input,
            obscureText: controller.obscureText,
            controller: controller.passwordController,
            validator: controller.validatePassword,
            suffixIcon: GestureDetector(
              onTap: () => controller.toggle(),
              child: controller.icon,
              
            ),
          ),
          kSmallVerticalSpacing,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){},
                child: Text(
                  'Forgot Password?',
                  textAlign: TextAlign.right,
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          kMediumVerticalSpacing,
          AppButton(
            label: 'SIGN IN',
             color: kPrimaryColor,
            gradient:  LinearGradient(
              colors: <Color>[Color(0xFFB349B1), Color(0xFF81007F)], 
            ),
            textColor: Colors.white,
            isLoading: controller.state == NotifierState.isLoading,
            onPressed: controller.state == NotifierState.isLoading
                ? null
                : (){controller.login(controller.emailAddressController.text, controller.passwordController.text);}
          ),
        ],
      ),
    );
  }


  Widget dontHaveAccount(SigninController controller) {
    return Center(
      child: Text.rich(
        TextSpan(
          text: 'Don\'t have an account yet?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          children: <TextSpan>[
            TextSpan(
              text: ' Sign Up',
              style: TextStyle(color: kPrimaryColor),
               recognizer: controller.signup,
            )
          ],
        ),
      ),
    );
  }
}
