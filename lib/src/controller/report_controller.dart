
import 'package:get/get.dart';
import 'package:expense_tracker/src/models/expense.dart';
import 'package:expense_tracker/src/models/income.dart';
import 'package:expense_tracker/src/services/api.dart';

class ReportController extends GetxController {
  ReportController();
 
  var getExpense = List<Expense>().obs;
  var getIncome = List<Income>().obs;
  
  var expenseLoading = true.obs;
  var incomeLoading = true.obs;

  @override
    void onInit() {
      getAllExpense();
      getAllIncome();
      super.onInit();
    }

    void reload() {
      getAllExpense();
      getAllIncome();
      getTotalExpense();
      getTotalIncome();
      super.onReady();
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
          print('object');
        } else {
          print("null");
        }
      } finally {
        incomeLoading.value = false;
      }
    }

    int getTotalIncome(){
      int total = 0;
      for (var i = 0; i < getIncome.length; i++) {
        total += getIncome[i].amount;
      }
      return total;
    }

    int getTotalExpense(){
      int total = 0;
      for (var i = 0; i < getExpense.length; i++) {
        total += getExpense[i].amount;
      }
      return total;
    }
  
}