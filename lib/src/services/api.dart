import 'package:expense_tracker/src/core/shared_preferences.dart';
import 'package:expense_tracker/src/models/signin_params.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:expense_tracker/src/models/expense.dart';
import 'package:expense_tracker/src/models/income.dart';
import 'package:expense_tracker/src/models/budget.dart';

class APIService {
  String email, password;
  // Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
  //   String url = "https://pjt-70.herokuapp.com/api/login";

  //   final response = await http.post(
  //     url,
  //     headers: {
  //         "Accept": "application/json",
  //        // "Content-Type": "application/x-www-form-urlencoded"
  //       },
  //     body: requestModel.toJson());
  //   if (response.statusCode == 200 || response.statusCode == 400) {
  //     return LoginResponseModel.fromJson(
  //       json.decode(response.body),
  //     );
  //   } else {
  //     throw Exception('Failed to load data!');
  //   }
  // }
  login(String email, String password) async {
    http.post(
      "https://pjt-70.herokuapp.com/api/login",
      headers: {
        "Accept": "application/json",
        // "Content-Type": "application/x-www-form-urlencoded"
      },
      body: {'email': email, 'password': password},
      //encoding: Encoding.getByName("utf-8")
    ).then((response) {
      print(response.statusCode);
      print(response.body);
    });
  }

Future<List<Expense>> fetchExpense() async {
  String token = await UserPreferences().getToken();
  var response = await http.get(
    'https://pjt-70.herokuapp.com/api/expense',
    headers: {
      "Accept": "application/json",
      "Authorization" : "Bearer $token",
    });
  if(response.statusCode == 200){
    var jsonString = response.body;
    return expenseFromJson(jsonString);
  } else {
    return null;
  }
} 
  
Future<List<Income>> fetchIncome() async {
  String token = await UserPreferences().getToken();
  var response = await http.get(
    'https://pjt-70.herokuapp.com/api/income',
    headers: {
      "Accept": "application/json",
      "Authorization" : "Bearer $token",
    });
  if(response.statusCode == 200){
    var jsonString = response.body;
    return incomeFromJson(jsonString);
  } else {
    return null;
  }
} 

Future<Budget> fetchBudget() async {
  String token = await UserPreferences().getToken();
  var response = await http.get(
    'https://pjt-70.herokuapp.com/api/budget',
    headers: {
      "Accept": "application/json",
      "Authorization" : "Bearer $token",
    });
  if(response.statusCode == 200){
    var jsonString = response.body;
    return budgetFromJson(jsonString);
  } else {
    return null;
  }
} 

}
