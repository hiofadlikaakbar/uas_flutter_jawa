import 'package:flutter/material.dart';

class SplashScreen4 extends StatelessWidget {
  const SplashScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.pushReplacementNamed(context, '/login');
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
            ),
          ),
          child: Stack(
            children: [
              // GIF utama (tidak full screen)
              Center(
                child: Opacity(
                  opacity: 0.9,
                  child: Image.asset(
                    "assets/images/jawa.gif",
                    width: 600,
                    height: 500,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Branding bawa
              Positioned(
                bottom: 80,
                left: 0,
                right: 0,
                child: Column(
                  children: const [
                    Text(
                      "JawaKode",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyanAccent,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Klik dimana saja untuk melanjutkan",
                      style: TextStyle(fontSize: 13, color: Colors.white54),
                    ),
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
