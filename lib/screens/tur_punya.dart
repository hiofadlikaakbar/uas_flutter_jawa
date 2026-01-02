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
            height: size.height * 0.4,
            width: size.width,
            child: Image.asset('images/Tur.jpg', fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
