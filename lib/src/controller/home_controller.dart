
import 'package:expense_tracker/src/core/shared_preferences.dart';
import 'package:expense_tracker/src/models/app_user.dart';
import 'package:get/get.dart';
import 'package:expense_tracker/src/models/expense.dart';
import 'package:expense_tracker/src/models/income.dart';
import 'package:expense_tracker/src/models/budget.dart';
import 'package:expense_tracker/src/services/api.dart';

class HomeController extends GetxController {
  HomeController();

  var getUser = User().obs;
  var getExpense = List<Expense>().obs;
  var getIncome = List<Income>().obs;
  var getBudget = Budget().obs;
  var nameLoading = true.obs;
  var expenseLoading = true.obs;
  var incomeLoading = true.obs;

  @override
    void onInit() {
      getUserMethod();
      getAllExpense();
      getAllIncome();
      getUserBudget();
      super.onInit();
    }

    void reload() {
      getUserMethod();
      getAllExpense();
      getAllIncome();
      getUserBudget();
      getTotalExpense();
      super.onReady();
    }

    void getUserMethod() async {
      try {
        nameLoading.value = true;
        var result = await UserPreferences().getUser();
        if(result != null){
          getUser.value = result;
        } else {
          print("null");
        }
      } finally {
        nameLoading.value = false;
      }
      
    }


    void getAllExpense() async {
      try {
        expenseLoading.value = true;
        var result = await APIService().fetchExpense();
        if(result != null){
          getExpense.value = result;
        } else {
          print("null");
        }
      } finally {
        expenseLoading.value = false;
      }
    }

    void getAllIncome() async {
      try {
        incomeLoading.value = true;
        var result = await APIService().fetchIncome();
        if(result != null){
          getIncome.value = result;
        } else {
          print("null");
        }
      } finally {
        incomeLoading.value = false;
      }
    }

    int getTotalExpense(){
      int total = 0;
      for (var i = 0; i < getExpense.length; i++) {
        total += getExpense[i].amount;
      }
      return total;
    }

    void getUserBudget() async{
      var result = await APIService().fetchBudget();
        if(result != null){
          getBudget.value = result;
        } else {
          print("null");
        }
    }
  
}