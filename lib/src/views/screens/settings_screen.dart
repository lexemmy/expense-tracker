import 'package:expense_tracker/src/core/constants.dart';
import 'package:expense_tracker/src/views/screens/profile_screen.dart';
import 'package:expense_tracker/src/views/widget/app_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Settings',style: TextStyle(color: Color(0xff696969)),),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          color: Color(0xff696969),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        alignment:Alignment.center,
          children:[
            Container(
              height: 450,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal:10),
              child: Column(
                children: [
                  kMediumVerticalSpacing,
                  // Icon(Icons.edit) ?? Container(),
                  AppCard(title:'Currency',
                      leading: Icons.money,
                      trailing: Icons.casino),
                  kExtraSmallVerticalSpacing,
                  AppCard(title: 'Edit Category',
                  leading: Icons.edit,
                  trailing: Icons.edit,)
                ],
              ),
            )
          ]
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //   color: kPrimaryColor,
      //   backgroundColor: Colors.white,
      //   buttonBackgroundColor:  kPrimaryColor,
      //   items:<Widget>[
      //     Icon(Icons.add_a_photo_outlined, size:20, color: Colors.white,),
      //     Icon(Icons.add, size:20, color: Colors.white,),
      //     Icon(Icons.settings, size:20, color: Colors.white,)
      //   ],
      //   animationDuration: Duration(
      //       milliseconds: 200
      //   ),
      //   index: 1,
      //   animationCurve: Curves.bounceInOut,
      //   onTap: (index){
      //   },
      // ),
   
    );
  }
}