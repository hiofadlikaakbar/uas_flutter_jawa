import 'package:flutter/material.dart';

class MyAfnan extends StatelessWidget {
  const MyAfnan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Afnan Dani",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: "Outfit",
                ),
              ),

              const SizedBox(height: 16),

              Stack(
                alignment: Alignment.center,
                children: [
                  Transform(
                    transform: Matrix4.skewX(-0.1), // Efek miring ke kanan
                    child: Container(
                      width: 180,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.skewX(-0.1),
                    child: Container(
                      width: 160,
                      height: 190,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        image: const DecorationImage(
                          image: NetworkImage('images/afnan.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
