import 'package:expense_tracker/src/views/screens/profile_screen.dart';
import 'package:expense_tracker/src/views/screens/set_budget_screen.dart';
import 'package:expense_tracker/src/views/screens/settings_screen.dart';
import 'package:expense_tracker/src/views/screens/report_screen.dart';
import 'package:expense_tracker/src/views/screens/transcation_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);
  void handleNavigation(int index) {
    print(index);
    switch (index) {
      case 0:
        Get.to(ReportScreen());
        break;
      //navigate to set budget screen
      case 1:
        Get.to(TransactionScreen());
        break;
      case 2:
        Get.to(SettingScreen());//TODO:navigate to settings page
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      fixedColor: Colors.white,
      unselectedItemColor: Colors.white,
      backgroundColor: Color(0xFF81007F),
      onTap: handleNavigation,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: Color(0xFF81007F),
          icon: Icon(Icons.image_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.gear_alt),
          label: '',
        ),
      ],
    );
  }
}
