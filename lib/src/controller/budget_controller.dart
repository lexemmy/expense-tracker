import 'package:expense_tracker/src/core/constants.dart';
import 'package:expense_tracker/src/core/notifier.dart';
import 'package:expense_tracker/src/core/shared_preferences.dart';
import 'package:expense_tracker/src/views/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;


class SetBudgetController extends Notifier {
  // SetBudgetController(this.budget);
  DateTimeRange _pickedDate;
  // final String budget;

  final _yearController = TextEditingController();
  final _dateController = TextEditingController();
  final _incomeController = TextEditingController();
  final _budgetController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  TextEditingController get yearController => _yearController;
  TextEditingController get dateController => _dateController;
  TextEditingController get incomeController => _incomeController;
  TextEditingController get budgetController => _budgetController;


  GlobalKey<FormState> get formKey => _formKey;


  @override
  void onInit() {
    _yearController.text;
    super.onInit();
  }

  Future<Null> selectDate(BuildContext context) async {
    // Get.focusScope.unfocus();
    final intialDateRange = DateTimeRange(
      start: DateTime.now(), 
      end: DateTime.now().add(Duration(hours: 24 * 3))
      );
    final date = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDateRange: _pickedDate ?? intialDateRange
      );

    
    if (date != null) {
      _pickedDate = date;
      _dateController.text = DateFormat('dd/MM/yyyy').format(_pickedDate.start) +" - "+ DateFormat('dd/MM/yyyy').format(_pickedDate.end);
      update(); 
    
    }
  }

  void addBudget() async {
    Get.focusScope.unfocus();
    if (_formKey.currentState.validate()) {
      setState(NotifierState.isLoading);

     String token = await UserPreferences().getToken();

    await http.post(
        "https://pjt-70.herokuapp.com/api/budget",
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        },
        body: {
      'startdate': DateFormat('dd/MM/yyyy').format(_pickedDate.start).toString(),
      'enddate': DateFormat('dd/MM/yyyy').format(_pickedDate.end).toString(),
      'income':  incomeController.text,
      'budget': budgetController.text
        },
    ).then((response) {
      if(response.statusCode == 200) {
                
        print('Token : $token');
        print(response.statusCode);
        print(response.body);
        Get.snackbar(
          'Success',
          "Added Successfully",
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
          "Error while adding budget",
          colorText: Get.theme.colorScheme.onError,
          backgroundColor: Get.theme.errorColor,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      setState(NotifierState.isIdle);      
    }); 
    }}


}