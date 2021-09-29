import 'package:expense_tracker/src/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as service;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    service.SystemChrome.setPreferredOrientations([
      service.DeviceOrientation.portraitUp,
    ]);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Personal Finance tracker',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: SplashScreen(),
    );
  }
}
