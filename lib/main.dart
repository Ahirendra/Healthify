import 'package:flutter/material.dart';
import 'package:healthify/PhonePePayment.dart';
import 'package:healthify/doctor/doctor_signin.dart';
import 'package:healthify/models/user.dart';
import 'package:healthify/user/auth/firebase_auth_services.dart';
import 'package:healthify/user/auth/signin.dart';
import 'package:healthify/user/home_page/doctor_detail.dart';
import 'package:healthify/user/auth/signup.dart';
import 'package:healthify/user/navigation.dart';
import 'package:healthify/user/pharmacy/meds.dart';
import 'package:healthify/welcome/welcome.dart';
import 'package:healthify/wrapper.dart';
import 'package:provider/provider.dart';
import 'doctor/doctor_signup.dart';
import 'models/doc.dart';
import 'user/home_page/home_screen.dart';
import 'user/myOrders/myorders.dart';
import 'models/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Welcome(),
    );
  }
}

