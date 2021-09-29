import 'package:expense_tracker/src/controller/home_controller.dart';
import 'package:expense_tracker/src/core/constants.dart';
import 'package:expense_tracker/src/core/images.dart';
import 'package:expense_tracker/src/views/screens/profile_screen.dart';
import 'package:expense_tracker/src/views/screens/set_budget_screen.dart';
import 'package:expense_tracker/src/views/widget/switch.dart';
import 'package:expense_tracker/src/views/widget/bottom_nav_bar.dart';
import 'package:expense_tracker/src/views/widget/expense_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {

   var showExpense = true.obs;
   var showType = true.obs;
    return SafeArea(
      child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) => Scaffold(
          backgroundColor: Colors.white,
          body: Obx((){
            return Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 10.0),
            child: ListView(
              children: <Widget>[
                GestureDetector(
                  onTap:(){Get.to(ProfileScreen());},
                  child: header(context, controller.getUser.value.name)),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 20.0,
                        width: 20.0,
                        child: ClipRect(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Image(image: AssetImage(icon1)),
                          ),
                        ),
                      ),
                      kExtraSmallHorizontalSpacing,
                      GestureDetector(
                        onTap: (){
                          controller.reload();
                        },
                        child: Text(
                          'income',
                          style: TextStyle(color: Color(0xFFA928A7)),
                        ),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Container(
                        height: 20.0,
                        width: 20.0,
                        child: ClipRect(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Image(image: AssetImage(icon2)),
                          ),
                        ),
                      ),
                      kExtraSmallHorizontalSpacing,
                      Text(
                        'savings',
                        style: TextStyle(color: Color(0xFFA928A7)),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '₦' +controller.getBudget.value.income.toString(),
                          style: kHeading2TextStyle,
                        ),
                        kSmallHorizontalSpacing,
                        Text(
                          (controller.getBudget.value.income - controller.getBudget.value.budget).toString(),
                          style: kHeading2TextStyle,
                        )
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new CircularPercentIndicator(
                          startAngle: 180.0,
                          radius: 200.0,
                          lineWidth: 25.0,
                          animation: true,
                          percent: double.parse((controller.getTotalExpense()/controller.getBudget.value.budget).toStringAsFixed(1)),
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap:()=> Get.to(SetBudget()),
                                child: Column(
                                  children: [
                                    Text('Budget'),
                                    Text(
                                  '₦' + controller.getBudget.value.budget.toString(),
                                  style: kHeadingTextStyle
                                  ),
                                  ],
                                ),
                              ),
                              // Text(
                              //   '₦35,000',
                              //   style: kHeadingTextStyle
                              //   ),
                              kSmallVerticalSpacing,
                              Text('spent'),
                              Text(
                                controller.getTotalExpense().toString()??'0',
                                style: kHeading1TextStyle,
                              ),
                            ],
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Color(0xFF81007F),
                          backgroundColor: Color(0x80A926A7),
                        )
                      ],
                    )),
                    SwitchButton(label_1: 'Category',label_2: 'Type',
                     onToggle: (value){
                       if (value == 1) {
                        showType.value = true;
                      } else {
                        showType.value = false;
                      }
                     }),
                
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          showExpense.value = true;
                        },
                        child: Text(
                          'Expenses',
                          style: showExpense.value ? TextStyle(fontWeight: FontWeight.bold) : TextStyle(),
                        ),
                      ),
                      kSmallHorizontalSpacing,
                      GestureDetector(
                        onTap: (){
                          showExpense.value = false;
                        },
                        child: Text('Income',
                        style: showExpense.value ? TextStyle() : TextStyle(fontWeight: FontWeight.bold),))
                    ],
                  ),
                ),
                Container(
                  child: Obx((){
                    if(showExpense.value){
                      return ListView.builder(
                    shrinkWrap: true,
                          itemCount: controller.getExpense.length > 3 ? 3 : controller.getExpense.length,
                          //controller: scrollController,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: showType.value ? Text(controller.getExpense[index].type) : Text(controller.getExpense[index].category),
                              trailing: Text('-₦' + controller.getExpense[index].amount.toString(),
                              style: TextStyle(color: Color(0xFFFF3939)),),
                            );
                          });
                    } else {
                      return ListView.builder(
                    shrinkWrap: true,
                          itemCount: controller.getIncome.length > 3 ? 3 : controller.getIncome.length,
                          //controller: scrollController,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: showType.value ? Text(controller.getExpense[index].type) : Text(controller.getIncome[index].category),
                              trailing: Text('+₦' + controller.getIncome[index].amount.toString(),
                              style: TextStyle(color: Color(0xFF00FF00)),),
                            );
                          });
                    }
                  }),
                )
              ],
            ),
          );
          }),
          bottomNavigationBar: BottomNavBar()),
    ));
  }
}




  Widget header(BuildContext context, String name) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image(
                            image: AssetImage(profile)),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Welcome,'),
                      Text(name,
                        style:
                            TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Text('Achieve your goal today.')
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(CupertinoIcons.bell),
          )
        ],
      ),
    );
  }




