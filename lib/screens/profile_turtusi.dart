import 'package:flutter/material.dart';
import 'package:uas_flutter_jawa/screens/final_tur_punya.dart';

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
            child: Image.asset('assets/images/Tur.jpg', fit: BoxFit.cover),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
                  ),
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
            height: size.height * 0.50,
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
                children: [
                  Text(
                    "Muhammad Turtusi Afrizal Perdana",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 26, // 🔧 dari 40 → 26
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 8),
                  Text(
                    "1123150012",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),

                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      W1(title: "Followers", value: "1K"),
                      W1(title: "Following", value: "2K"),
                      W1(title: "Projects", value: "2"),
                    ],
                  ),
                  Spacer(),

                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.facebook, color: Colors.white),
                      SizedBox(width: 12),
                      Icon(Icons.camera_alt, color: Colors.white),
                      SizedBox(width: 12),
                      Icon(Icons.alternate_email, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 24),
                  GestureDetector(
                    onVerticalDragUpdate: (details) {
                      if (details.delta.dy < -8) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LayoutFinalPage(),
                          ),
                        );
                      }
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.keyboard_arrow_up,
                          size: 36,
                          color: Colors.white,
                        ),
                        Text(
                          "Swipe Up",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                            fontFamily: 'RobotoMono',
                          ),
                        ),
                      ],
                    ),
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

class W1 extends StatelessWidget {
  final String title;
  final String value;

  const W1({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'RobotoMono',
          ),
        ),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
