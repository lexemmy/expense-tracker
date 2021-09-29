import 'package:expense_tracker/src/core/constants.dart';
import 'package:expense_tracker/src/models/app_user.dart';
import 'package:http/http.dart' as http;
import 'package:expense_tracker/src/views/screens/home_screen.dart';
import 'package:expense_tracker/src/views/screens/signup_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/notifier.dart';

import '../core/validation_mixin.dart';
import '../core/constants.dart';

import 'dart:convert';
import 'package:expense_tracker/src/core/shared_preferences.dart';


class SigninController extends Notifier with ValidationMixin {
  AppUser user;
  final _emailAddressController = TextEditingController();
  final _passwordController = TextEditingController();
  String email,password;
  bool isLoading=false;

  bool _obscureText = true;
  Icon _icon = Icon(Icons.visibility, color: kPrimaryColor);

  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TapGestureRecognizer _forgotPassword;

  bool get obscureText => _obscureText;
  Icon get icon => _icon;
  TextEditingController get emailAddressController => _emailAddressController;
  TextEditingController get passwordController => _passwordController;

  TapGestureRecognizer get forgotPassword => _forgotPassword;
  GlobalKey<FormState> get formKey => _formKey;

  TapGestureRecognizer _signUp;
  TapGestureRecognizer get signup => _signUp;

  void onInit() {
    
    _signUp = TapGestureRecognizer()
      ..onTap = () {
        Get.off(SignUpScreen());
      };
     super.onInit();
  }
  
  void toggle() {
     setState(NotifierState.isIdle);
    _obscureText = !_obscureText;
    if (!_obscureText) {
      _icon = Icon(Icons.visibility_off, color: kPrimaryColor);
    } else {
      _icon = Icon(Icons.visibility, color:  kPrimaryColor);
    }
  }

  
  // void signinUser() async {
  login(String email, String password) async{
    Get.focusScope.unfocus();
    if (_formKey.currentState.validate()) {
      setState(NotifierState.isLoading);

  //  final users = 
    await http.post(
        "https://pjt-70.herokuapp.com/api/login",
        headers: {
          "Accept": "application/json",
        },
        body: {
      'email': email,
      'password': password
        },
    ).then((response) {
      if(response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        
        
        User authUser = User.fromJson(responseData);
        
        UserPreferences().saveUser(authUser);


        print(response.statusCode);
        print(response.body);
        Get.snackbar(
          'Success',
          "Successfully logged in",
          colorText: Colors.white,
          backgroundColor: kPrimaryColor,
          snackPosition: SnackPosition.BOTTOM,
        );
        setState(NotifierState.isIdle);

      Get.to(HomeScreen()); 
      }else{
        setState(NotifierState.isIdle);
        print(response.statusCode);
        print(response.body);
        Get.snackbar(
          'Error',
          "User does not exist",
          colorText: Get.theme.colorScheme.onError,
          backgroundColor: Get.theme.errorColor,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      setState(NotifierState.isIdle);      
    }); 
    }
}}