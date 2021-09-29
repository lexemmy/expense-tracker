
import 'package:expense_tracker/src/core/constants.dart';
import 'package:expense_tracker/src/views/screens/signin_screen.dart';
import 'package:expense_tracker/src/views/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense_tracker/src/core/shared_preferences.dart';
import 'package:expense_tracker/src/models/app_user.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {

  var getUser = User().obs;

  @override
    void onInit() {
      getUserMethod();
      super.onInit();
    }

    getUserMethod() async {
      var result = await UserPreferences().getUser();
      getUser.value = result;
    }


  void signOut() async{ 
      
     String token = await UserPreferences().getToken();

    await http.post(
        "https://pjt-70.herokuapp.com/api/logout",
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        },
    ).then((response) {
      // if(response.statusCode == 200) {           
      //   print('Token : $token');
      //   print(response.statusCode);
      //   print(response.body);
        Get.snackbar(
          'Success',
          "SuccessFully logged out",
          colorText: Colors.white,
          backgroundColor: kPrimaryColor,
          snackPosition: SnackPosition.BOTTOM,
        );
        UserPreferences().removeUser();
        Get.offAll(SignUpScreen()); 
      // }else{
      //   print(response.statusCode);
      //   print(response.body);
      //   Get.snackbar(
      //     'Error',
      //     "Error while logging out",
      //     colorText: Get.theme.colorScheme.onError,
      //     backgroundColor: Get.theme.errorColor,
      //     snackPosition: SnackPosition.BOTTOM,
      //   );
      // }
    }); 
    }
}