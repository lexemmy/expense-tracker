import 'package:expense_tracker/src/core/constants.dart';
import 'package:expense_tracker/src/core/images.dart';
import 'package:expense_tracker/src/views/screens/settings_screen.dart';
import 'package:expense_tracker/src/views/widget/app_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense_tracker/src/controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {

  final controller = Get.put(ProfileController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    elevation: 0.0,
      backgroundColor: kPrimaryColor,
      leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: ()=> Get.back(),
      ),
    ),
    body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child:  profileActions(context)),         
          ]
        ),
      )
    );
  }
  Widget profileActions(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height / 8,
              child: Column(
                children: [
                  kSmallVerticalSpacing,
                  Text(controller.getUser.value.name,
                      textAlign: TextAlign.center, 
                      style: TextStyle(fontSize: 16,letterSpacing: 1.5, color: Colors.white), 
                  ),
                  kExtraSmallVerticalSpacing,
                  Text("Team of Amazing UI/UX\n designers on Zuri",
                      textAlign: TextAlign.center, 
                      style: TextStyle(fontSize: 12,letterSpacing: 1.0,color: Colors.white),
                    ),
                  ],
                ),
              ),
            painter: HeaderCurvedContainer(),
          ),
            kExtraSmallVerticalSpacing,
          Column(
            crossAxisAlignment:CrossAxisAlignment.stretch,
            children: [              
              Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width:5),
                  shape:BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit:BoxFit.cover,
                    image: AssetImage(profile),
                  ),
                ),
              ),
            ],
          ),
          kMediumVerticalSpacing,          
          AppCard(
            onPressed: (){},
            title: 'Edit Profile',
            trailing: Icons.person,
          ),
          kTinyVerticalSpacing,
          AppCard(
            onPressed: (){},
            title: 'Help',
            trailing: Icons.help,
          ),
          kTinyVerticalSpacing,
          AppCard(
            onPressed: (){},
            title: 'Share',
            trailing: Icons.share,
          ),
          kTinyVerticalSpacing,
          AppCard(
            onPressed: (){
              controller.signOut();
            },
            title: 'Log Out',
            trailing: Icons.logout,
          ),     
        ],
      ),
    );
  }

}
class HeaderCurvedContainer extends CustomPainter{
  @override
  void paint (Canvas canvas, Size size){
    Paint paint= Paint()..color=kPrimaryColor;
    Path path=Path()..relativeLineTo(0,150)..
    quadraticBezierTo(size.width/2, 300,size.width, 150)..
    relativeLineTo(0,-200)..close();
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate)=>false;
}