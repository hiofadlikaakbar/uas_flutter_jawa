import 'package:flutter/material.dart';

class SplashScreen extends StateLessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset('images/logo-global.png')));
  }
}
