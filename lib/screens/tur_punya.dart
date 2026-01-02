import 'package:flutter/material.dart';

class Tur extends StatelessWidget {
  const Tur({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: Image.asset('images/Tur.jpg', fit: BoxFit.cover),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: const [
                  Icon(Icons.arrow_back, color: Colors.black),
                  SizedBox(width: 8),
                  Text(
                    "Profil Tim",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: size.height * 0.3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                gradient: LinearGradient(
                  colors: [Color(0xFF0B1623), Color.fromARGB(255, 4, 56, 77)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                children: const [
                  Text(
                    "Muhammad Turtusi Afrizal Perdana",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "JAWA 3",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "tusi",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
