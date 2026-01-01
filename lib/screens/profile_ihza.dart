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
        ],
      ),
    );
  }
}