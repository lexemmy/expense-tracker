import 'package:expense_tracker/src/controller/transaction_controller.dart';
import 'package:expense_tracker/src/core/constants.dart';
import 'package:expense_tracker/src/core/notifier.dart';
import 'package:expense_tracker/src/views/widget/app_button.dart';
import 'package:expense_tracker/src/views/widget/app_button_icon.dart';
import 'package:expense_tracker/src/views/widget/app_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants.dart' as constants;

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Transaction', style: constants.mTitleStyle),
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
        child: GetBuilder<TransactionController>(
          init: TransactionController(),
          builder: (controller) => Container(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  form(context, controller),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget form(BuildContext context, TransactionController controller) {
  return Form(
    key: controller.formKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        kMediumVerticalSpacing,
        AppTextField(
          label: 'Amount',
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          hintText: '₦',
          controller: controller.amountController,
        ),
        kMediumVerticalSpacing,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            kMediumHorizontalSpacing,
            Radio(
                value: 1,
                groupValue: controller.radioValue,
                onChanged: (int rVal) {
                  controller.changeRadio(rVal);
                },
                activeColor: kPrimaryColor),
            Text('Income'),
            kLargeHorizontalSpacing,
            Radio(
                value: 2,
                groupValue: controller.radioValue,
                onChanged: (int rVal) {
                  controller.changeRadio(rVal);
                },
                activeColor: kPrimaryColor),
            Text('Expense'),
          ],
        ),
        kSmallVerticalSpacing,
        Text('Type', textAlign: TextAlign.center,),
        kSmallVerticalSpacing,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //kLargeHorizontalSpacing,
            AppButtonIcon(
              label: controller.type,
              icon: Icons.money,
              textColor: controller.pressed ? Colors.white : Colors.black,
              color: controller.pressed ? kPrimaryColor : Colors.white ,
              onPressed: (){
                controller.change();
              },
            ),
            kLargeHorizontalSpacing,
            AppButtonIcon(
              label: controller.type1,
              icon: Icons.card_travel,
              textColor: controller.pressed ? Colors.black : Colors.white,
              color: !controller.pressed ? kPrimaryColor : Colors.white,
              onPressed: (){
                controller.change();
              },
            ),
          ],
        ),
        AppTextField(
          label: 'Category',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          controller: controller.categoryController,
        ),
        kMediumVerticalSpacing,
        GestureDetector(
          onTap: () {
            controller.selectDate(context);
          },
          child: AppTextField(
            label: 'Date',
            hintText: 'Today',
            // validator: controller.validateNotEmpty,
            controller: controller.dateController,
            enabled: false,
            suffixIcon: Icon(Icons.calendar_today),
          ),
        ),

        kExtraLargeVerticalSpacing,
        AppButton(
            label: 'ADD ENTRY',
            color: kPrimaryColor,
            gradient: LinearGradient(
              colors: <Color>[Color(0xFFB349B1), Color(0xFF81007F)],
            ),
            isLoading: controller.state == NotifierState.isLoading,
            textColor: Colors.white,
            onPressed: controller.state == NotifierState.isLoading
            ? null
            : (()=> controller.radioValue == 1?
            controller.addTransactionIncome():
            controller.addTransactionExpense()
            )
              // controller.addTransactionExpense;
        )
         // kMediumVerticalSpacing,

      ],
    ),
  );
}


