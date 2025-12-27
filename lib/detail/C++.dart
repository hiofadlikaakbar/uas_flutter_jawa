import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CPP extends StatelessWidget {
  const CPP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1623),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //  header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF0F2027),
                      Color(0xFF203A43),
                      Color(0xFF2C5364),
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Image.asset('../../images/c++.png', height: 36),
                    const SizedBox(width: 10),
                    const Text(
                      "C++",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const Text("1/1", style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ),

         
          ),
        ),
      ),
    );
  }
}

