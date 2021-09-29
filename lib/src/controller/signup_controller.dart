import 'dart:convert';

import 'package:expense_tracker/src/core/constants.dart';
import 'package:expense_tracker/src/core/validation_mixin.dart';
import 'package:expense_tracker/src/models/app_user.dart';
import 'package:expense_tracker/src/views/screens/home_screen.dart';
import 'package:expense_tracker/src/views/screens/signin_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../core/notifier.dart';

class SignUpController extends Notifier with ValidationMixin{
    AppUser user;
    String name, email, password, passwordConfirmation;

    final _nameController = TextEditingController();
    final _emailAddressController = TextEditingController();
    final _passwordController = TextEditingController();
    final _confirmPasswordController = TextEditingController();

    String value;
    bool _obscureText = true;
    Icon _icon = Icon(Icons.visibility, color: kPrimaryColor);

    final _formKey = GlobalKey<FormState>();
    TapGestureRecognizer _signIn;

    bool get obscureText => _obscureText;
    Icon get icon => _icon;
    
    TextEditingController get nameController => _nameController;
    TextEditingController get emailAddressController => _emailAddressController;
    TextEditingController get passwordController => _passwordController;
    TextEditingController get confirmPasswordController => _confirmPasswordController;

    GlobalKey<FormState> get formKey => _formKey;
    TapGestureRecognizer get signin => _signIn;

    @override
    void onInit() {
      _signIn = TapGestureRecognizer()
        ..onTap = () {
          Get.off(SigninScreen());
        };
      super.onInit();
    }

  void toggle() {
    setState(NotifierState.isIdle);
    _obscureText = !_obscureText;
    if (!_obscureText) {
      _icon = Icon(Icons.visibility_off, color: kPrimaryColor);
    } else {
      _icon = Icon(Icons.visibility, color: kPrimaryColor);
    }
  }

  String confirmPassword(String val) =>
    val != passwordController.text ? 'Password dont match': null;
  

  void signupUser() async {
    

    if (_formKey.currentState.validate()) {
      
        //  Get.to(SigninScreen());
        // Get.snackbar(
        //   'Success',
        //   'Registration sucessfull',
        //   colorText: Get.theme.colorScheme.background,
        //   backgroundColor: kPrimaryColor,
        //   snackPosition: SnackPosition.BOTTOM,
        // ); 
    }
  }

   signup(name,email,password, passwordConfirmation) async
  {
    Get.focusScope.unfocus();
     if (_formKey.currentState.validate()) {
      setState(NotifierState.isLoading);
  
   await http.post(
      "https://pjt-70.herokuapp.com/api/register",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      body: {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation
        },
        
        //encoding: Encoding.getByName("utf-8")
    ).then((response) {
      if(response.statusCode == 200) {
        print(response.statusCode);
        Get.snackbar(
          'Success',
          "Successfully SignUp",
          colorText: Colors.white,
          backgroundColor: kPrimaryColor,
          snackPosition: SnackPosition.BOTTOM,
        );
        setState(NotifierState.isIdle);
      Get.to(SigninScreen()); 
      }else{
        setState(NotifierState.isIdle);
        print(response.statusCode);
        print(response.body);
        Get.snackbar(
          'Error',
          response.body,
          colorText: Get.theme.colorScheme.onError,
          backgroundColor: Get.theme.errorColor,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      setState(NotifierState.isIdle);      
    }); 
    }

  }


}
