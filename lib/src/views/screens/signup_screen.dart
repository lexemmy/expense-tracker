import 'package:expense_tracker/src/controller/signup_controller.dart';
import 'package:expense_tracker/src/core/constants.dart';
import 'package:expense_tracker/src/core/images.dart';
import 'package:expense_tracker/src/core/notifier.dart';
import 'package:expense_tracker/src/views/widget/app_button.dart';
import 'package:expense_tracker/src/views/widget/app_textfield.dart';
import 'package:expense_tracker/src/views/widget/transparent_statusbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TransparentStatusbar(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GetBuilder<SignUpController>(
            init: SignUpController(),
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

  Widget form(SignUpController controller) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          kMediumVerticalSpacing,
          AppTextField(
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            hintText: 'Your name',
            suffixIcon: Icon(Icons.person,
            color: Color(0xFF810180),),
            controller: controller.nameController,
            validator: controller.validateNotEmpty,
          ),
          kMediumVerticalSpacing,
          AppTextField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            hintText: 'Your email',
            suffixIcon: Icon(Icons.mail,
            color: Color(0xFF810180),),
            controller: controller.emailAddressController,
            validator: controller.validateEmail,
          ),
          kMediumVerticalSpacing,
          AppTextField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            hintText: 'Password',
            obscureText: controller.obscureText,
            controller: controller.passwordController,
            validator: controller.validatePassword,
            suffixIcon: GestureDetector(
              onTap: () => controller.toggle(),
              child: controller.icon,
              
            ),
          ),
          kMediumVerticalSpacing,
          AppTextField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            hintText: 'Confirm password',
            obscureText: controller.obscureText,
            controller: controller.confirmPasswordController,
             validator: controller.confirmPassword,
          ),

          kMediumVerticalSpacing,
          AppButton(
            label: 'SIGN UP',
             color: kPrimaryColor,
            gradient:  LinearGradient(
              colors: <Color>[Color(0xFFB349B1), Color(0xFF81007F)], 
            ),
            textColor: Colors.white,
             isLoading: controller.state == NotifierState.isLoading,
            onPressed: controller.state == NotifierState.isLoading
                ? null
                :(){
              controller.signup(
                controller.nameController.text, 
                controller.emailAddressController.text, 
                controller.passwordController.text,
                controller.confirmPasswordController.text);}
          ),
        ],
      ),
    );
  }


  Widget dontHaveAccount(SignUpController controller) {
    return Center(
      child: Text.rich(
        TextSpan(
          text: 'Already have an account?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          children: <TextSpan>[
            TextSpan(
              text: ' Sign In',
              style: TextStyle(color: kPrimaryColor),
                recognizer: controller.signin,
            )
          ],
        ),
      ),
    );
  }
}
