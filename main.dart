import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest6_1915016121_rhennanurlisa/controller/homepage.dart';
import 'package:posttest6_1915016121_rhennanurlisa/controller/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}