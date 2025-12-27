import 'package:flutter/material.dart';

class Go extends StatelessWidget {
  const Go({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1623),
      body: const Center(
        child: Text("GO PAGE", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
