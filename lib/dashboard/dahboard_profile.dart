import 'package:flutter/material.dart';

class DashboardProfile extends StatelessWidget {
  const DashboardProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> teamMembers = [
      {
        "name": "Hio Fadlika Akbar",
        "role": "KETUA PARA JAWA",
        "image": "images/hio.jpeg",
        "route": "/profile_hio",
      },
      {
        "name": "Ihza Anasrulloh",
        "role": "JAWA 2",
        "image": "images/ihza.jpg",
        "route": "/profile_ihza",
      },
      {
        "name": "Muhammad Turtusi Afrizal",
        "role": "JAWA 3",
        "image": "images/1.4.jpeg",
        "route": "/tur_punya",
      },
      {
        "name": "Afnan Dani",
        "role": "JAWA 4",
        "image": "images/afnan.jpeg",
        "route": "/profile_afnan",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0B1623),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Profil Tim",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
