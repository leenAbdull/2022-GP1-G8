// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors

import 'package:cyberphish/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

// CyberPhish app starts here, initialize app and firebase
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(428, 926),
        builder: (context, widget) {
          return GetMaterialApp(
              title: 'CyberPhish',
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                fontFamily: "Quicksand-Regular",
                primarySwatch: Colors.deepPurple,
              ),
              debugShowCheckedModeBanner: false,
              home: WelcomeScreen() // calling welcome Screen
              );
        });
  }
}
