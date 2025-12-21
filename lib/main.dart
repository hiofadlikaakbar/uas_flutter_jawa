import 'package:flutter/material.dart';
import 'package:uas_flutter_jawa/screens/login.dart';
import 'package:uas_flutter_jawa/screens/splash_screen3.dart';
import 'screens/splash_screen.dart';
import 'screens/splash_screen2.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mulai Belajar",
      initialRoute: '/',
      routes: {'/': (context) => const SplashScreen(),
      '/splash2': (context) => const SplashScreen2(),
      '/splash3': (context) => const SplashScreen3(),
      '/login': (context) => const LoginPage(),},
    );
  }
}