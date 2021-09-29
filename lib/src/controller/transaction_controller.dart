import 'dart:convert';

import 'package:expense_tracker/src/core/constants.dart';
import 'package:expense_tracker/src/core/notifier.dart';
import 'package:expense_tracker/src/core/shared_preferences.dart';
import 'package:expense_tracker/src/models/app_user.dart';
import 'package:expense_tracker/src/views/screens/home_screen.dart';
import 'package:expense_tracker/src/views/screens/signin_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;


class TransactionController extends Notifier {
  // TransactionController(this.budget);
  DateTime _pickedDate;

  final _amountController = TextEditingController();
  final _dateController = TextEditingController();
  final _categoryController = TextEditingController();
  String _type = "Cash";
  String _type1 = "Card";

  final _formKey = GlobalKey<FormState>();
  int _radioValue;
  var pressed = false ; 
  List<bool> _selections =  List.generate(3, (_) => false);

  TextEditingController get amountController => _amountController;
  TextEditingController get dateController => _dateController;
  TextEditingController get categoryController => _categoryController;


  GlobalKey<FormState> get formKey => _formKey;
  int get radioValue => _radioValue;
  List<bool> get selections => _selections;
  String get type => _type;
  String get type1 => _type1;


  @override
  void onInit() {
    //_amountController.text;
    _pickedDate = DateTime.now();
    super.onInit();
  }


  void changeRadio(value) {
   // setState(NotifierState.isIdle);
    _radioValue = value;
    update();
  }

  void change(){
    pressed = !pressed;
    update();
  }

  Future<Null> selectDate(BuildContext context) async {
    Get.focusScope.unfocus();

    DateTime _date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: _pickedDate,
    );

    if (_date != null) {
      _pickedDate = _date;
      _dateController.text = DateFormat.yMMMMEEEEd().format(_pickedDate);
      update();
    }
  }

   void addTransactionIncome() async {
 // addTransaction(String category, String amount, String type) async{
    Get.focusScope.unfocus();
    if (_formKey.currentState.validate()) {
      setState(NotifierState.isLoading);

     String token = await UserPreferences().getToken();

    await http.post(
        "https://pjt-70.herokuapp.com/api/income",
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        },
        body: {
      'category': categoryController.text,
      'amount': amountController.text,
      'type': type ?? type1 ,
        },
    ).then((response) {
      if(response.statusCode == 201) {
                
        print('Token : $token');
        print(response.statusCode);
        print(response.body);
        Get.snackbar(
          'Success',
          "Transaction Added Successfully",
          colorText: Colors.white,
          backgroundColor: kPrimaryColor,
          snackPosition: SnackPosition.BOTTOM,
        );
        setState(NotifierState.isIdle);
    
      Get.to(HomeScreen()); 
      }else if (response.statusCode == 401){
        Get.to(SigninScreen()); 
        Get.snackbar(
          'UnAuthorized',
          "Token expired please login",
          colorText: Colors.white,
          backgroundColor: kPrimaryColor,
          snackPosition: SnackPosition.BOTTOM,
        );  
      }else{
        setState(NotifierState.isIdle);
        print(response.statusCode);
        print(response.body);
        Get.snackbar(
          'Error',
          "Error while adding transaction",
          colorText: Get.theme.colorScheme.onError,
          backgroundColor: Get.theme.errorColor,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      setState(NotifierState.isIdle);      
    }); 
    }}


   void addTransactionExpense() async {
 // addTransaction(String category, String amount, String type) async{
    Get.focusScope.unfocus();
    if (_formKey.currentState.validate()) {
      setState(NotifierState.isLoading);

      String token = await UserPreferences().getToken();

     
    http.post(
        "https://pjt-70.herokuapp.com/api/expense",
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        },
        body: {
      'category': categoryController.text,
      'amount': amountController.text,
      'type': type ?? type1,
        },
    ).then((response) {
      if(response.statusCode == 201) {                
        print('Token : $token');
        print(response.statusCode);
        print(response.body);
        Get.snackbar(
          'Success',
          "Transaction Added Successfully",
          colorText: Colors.white,
          backgroundColor: kPrimaryColor,
          snackPosition: SnackPosition.BOTTOM,
        );
        setState(NotifierState.isIdle);
        update();
      Get.offAll(HomeScreen()); 
      }else if (response.statusCode == 401){
        Get.offAll(SigninScreen()); 
        Get.snackbar(
          'UnAuthorized',
          "Token expired please login",
          colorText: Colors.white,
          backgroundColor: kPrimaryColor,
          snackPosition: SnackPosition.BOTTOM,
        );  
      }else{
        setState(NotifierState.isIdle);
        print(response.statusCode);
        print(response.body);
        Get.snackbar(
          'Error',
          "Error while adding transaction",
          colorText: Get.theme.colorScheme.onError,
          backgroundColor: Get.theme.errorColor,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      setState(NotifierState.isIdle);      
    }); 
    }}

}