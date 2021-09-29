import 'package:flutter/material.dart';
import 'package:expense_tracker/src/views/widget/switch.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:expense_tracker/src/controller/report_controller.dart';


class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}
var controller = Get.put(ReportController());

class _ReportScreenState extends State<ReportScreen> {
  
  @override
  Widget build(BuildContext context) {
    var show = true.obs;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          color: Color(0xff696969),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 200.0,
                  child: SfCartesianChart(
            // Initialize category axis
            primaryXAxis: CategoryAxis(),

            series: <LineSeries<SalesData, String>>[
              LineSeries<SalesData, String>(
                // Bind data source
                dataSource:  <SalesData>[
                  SalesData('Jan', 35),
                  SalesData('Feb', 28),
                  SalesData('Mar', 34),
                  SalesData('Apr', 32),
                  SalesData('May', 40)
                ],
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.sales
              )
            ]
          ),
                ),
                DropDown(),
                SwitchButton(
                    label_1: 'Income',
                    label_2: 'Expenses',
                    onToggle: (value) {
                      controller.reload();
                      if (value == 1) {
                        show.value = true;
                      } else {
                        show.value = false;
                      }
                    }),
                Obx((){
                  if (show.value) {
                    return Text(
                  controller.getTotalExpense().toString(),
                  style: TextStyle(
                    fontSize: 35.0,
                    color: Color(0xFFFF3939),
                  ),
                );
                  } else {
                    return Text(
                  controller.getTotalIncome().toString(),
                  style: TextStyle(
                    fontSize: 35.0,
                    color: Color(0xFFF00FF00),
                  ),
                );
                  }
                }),
              ],
            ),
            Container(
              child: Obx((){
                if (show.value){
                  return DraggableScrollableSheet(
                  initialChildSize: 0.35,
                  minChildSize: 0.28,
                  maxChildSize: 0.47,
                  builder:
                      (BuildContext context, ScrollController scrollController) {
                    return Container(
                      child: ListView.builder(
                          itemCount: controller.getExpense.length,
                          controller: scrollController,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(controller.getExpense[index].category),
                              trailing: Text('-₦' + controller.getExpense[index].amount.toString()),
                            );
                          }),
                      decoration: BoxDecoration(
                          color: Color(0xFFF5E6E1),
                          borderRadius: BorderRadius.circular(20)),
                    );
                  });
                } else {
                  return  DraggableScrollableSheet(
                  initialChildSize: 0.35,
                  minChildSize: 0.28,
                  maxChildSize: 0.47,
                  builder:
                      (BuildContext context, ScrollController scrollController) {
                    return Container(
                      child: ListView.builder(
                          itemCount: controller.getIncome.length,
                          controller: scrollController,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(controller.getIncome[index].category),
                              trailing: Text(controller.getIncome[index].amount.toString()),
                            );
                          }),
                      decoration: BoxDecoration(
                          color: Color(0xFFE6F5E1), 
                          borderRadius: BorderRadius.circular(20)),
                    );
                  });
                }
              })
              
                
            )
          ],
        ),
      ),
    );
  }
}

class DropDown extends StatefulWidget {
  const DropDown({Key key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

/// This is the private State class that goes with DropDown.
class _DropDownState extends State<DropDown> {
  String dropdownValue = 'Monthly';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down_outlined),
      iconSize: 24,
      elevation: 16,
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Daily', 'Weekly', 'Monthly', 'Yearly']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}


class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

