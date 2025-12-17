import 'package:flutter/material.dart';

class SplashScreen extends StateLessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEFE6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // judul/title
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text: "Selamat datang di "),
                    TextSpan(
                      text: "LearnCode",
                      style: TextStyle(color: Color(0xFFFF6A00)),
                    ),
                    TextSpan(text: "\nnow"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
