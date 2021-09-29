import 'package:expense_tracker/src/core/constants.dart';
import 'package:expense_tracker/src/core/notifier.dart';
import 'package:expense_tracker/src/views/widget/app_button.dart';
import 'package:expense_tracker/src/views/widget/app_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import "package:expense_tracker/src/controller/budget_controller.dart";
import '../../core/constants.dart' as constants;
import '../widget/app_dropdown.dart';

class SetBudget extends StatelessWidget {
  const SetBudget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SetBudgetController mm = SetBudgetController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(constants.mTitle, style: constants.mTitleStyle),
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
        child: GetBuilder<SetBudgetController>(
          init: SetBudgetController(),
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


Widget form(BuildContext context, SetBudgetController controller) {
  return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
              kMediumVerticalSpacing,
              AppDropdown(
                  items: [
                    'Yearly',
                    'Monthly',
                    'Weekly',
                    'Daily',
                  ],
                  label: 'Budget Type',
                  onChanged: (val) => controller.yearController.text = val,
                  value: 'Yearly',
                  validator: (val) => val == 'Select Budget'
                      ? 'Please select a valid day'
                      : null,
                ),      
               kMediumVerticalSpacing,           
              GestureDetector(
                onTap: () {
                controller.selectDate(context);
              },
                child: AppTextField(
                  // text: 'Start Time',
                  label: 'Budget Time Interval',
                  hintText: '06/27/2021  -  07/27/2021',
                  // validator: controller.validateNotEmpty,
                  controller: controller.dateController,
                  enabled: false,
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),
              kMediumVerticalSpacing,
              AppTextField(
                label: 'Income',
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                 hintText: '₦',
                controller: controller.incomeController,
          ),
              kMediumVerticalSpacing,
              AppTextField(
                    label: 'Budget',
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    hintText: '₦',
                    controller: controller.budgetController,
              ),
              kExtraLargeVerticalSpacing,
              AppButton(
              label: 'SET BUDGET',
             color: kPrimaryColor,
              gradient:  LinearGradient(
              colors: <Color>[Color(0xFFB349B1), Color(0xFF81007F)], 
            ),
            textColor: Colors.white,
            isLoading: controller.state == NotifierState.isLoading,
            onPressed: controller.state == NotifierState.isLoading
            ? null
            : ()=> controller.addBudget(),
          ),
              // kMediumVerticalSpacing,
            ],
          ),
  );
}
