import 'package:flutter/material.dart';
import 'package:uas_flutter_jawa/widget/bottom_nav_bar.dart';

class MyDashboard extends StatelessWidget {
  const MyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF0B1623),
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Dashboard',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white24,
                        child: Icon(Icons.notifications, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Pilih Bahasa\nPemrograman',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Mulai perjalanan coding kamu dengan memilih bahasa yang ingin dipelajari.\n'
                "Setiap bahasa memiliki kelebihan dan kegunaannya masing-masing.",
                style: TextStyle(color: Colors.white54, fontSize: 14),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _infobox("170+", "Pelajaran"),
                  _infobox("25K", "Pengguna"),
                  _infobox("6", "Languages"),
                ],
              ),
              const SizedBox(height: 25),
              Expanded(
                child: ListView(
                  children: [
                    _courseCard(
                      Title: "C++",
                      image: '../../images/c++.png',
                      desc: "Bahasa yang mudah dipelajari untuk pemula.",
                      lesson: "... Pelajaran",
                      level: "Pemula",
                      levelColor: Colors.green,
                      icon: Icons.code,
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

  Widget _courseCard({
    required String Title,
    required String image,
    required String desc,
    required String lesson,
    required String level,
    required MaterialColor levelColor,
    required IconData icon,
  }) {
    return Container(
      margin: ,
    )
  }
}

Widget _infobox(String value, String label) {
  return Container(
    width: 100,
    padding: const EdgeInsets.symmetric(vertical: 15),
    decoration: BoxDecoration(
      color: Colors.white10,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.white70)),
      ],
    ),
  );
}
