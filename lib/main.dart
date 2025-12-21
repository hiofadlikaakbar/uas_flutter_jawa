import 'package:flutter/material.dart';
import 'package:uas_flutter_jawa/screens/login.dart';
import 'screens/splash_screen.dart';

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
      '/login': (context) => const LoginPage(),},
    );
  }
}
