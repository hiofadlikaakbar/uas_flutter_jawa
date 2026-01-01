import 'package:flutter/material.dart';

class ProfileIhza extends StatelessWidget {
  const ProfileIhza({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1623),
      body: Stack(
        children: [
          Positioned(
            top: 120,
            left: 20,
            child: Text(
              "IHZA\nANASRULLOH",
              style: TextStyle(
                fontSize: 72,
                height: 0.9,
                fontWeight: FontWeight.w900,
                color: Colors.white.withOpacity(0.08),
              ),
            ),
          ),
          Positioned.fill(
            child: Transform.scale(
              scale: 1,
              child: Image.asset(
                "images/ihzawa.png",
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,  
                  ),  
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
