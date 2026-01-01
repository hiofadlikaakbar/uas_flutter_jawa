import 'package:flutter/material.dart';

class DashboardProfile extends StatelessWidget {
  const DashboardProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> teamMembers = [
      {
        "name": "Ihza Anasrulloh",
        "role": "JAWA 1",
        "image": "ihza.jpg",
      },
      {
        "name": "Hio Fadlika",
        "role": "KETUA PARA JAWA",
        "image": "ihza.jpg",
      },
      {
        "name": "Turtusi",
        "role": "JAWA 3",
        "image": "ihza.jpg",
      },
      {
        "name": "Afnan Dani",
        "role": "JAWA 4",
        "image": "ihza.jpg",
      },
      ];

    return Scaffold(
      backgroundColor: const Color(0xFF0B1623),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profil Tim",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}