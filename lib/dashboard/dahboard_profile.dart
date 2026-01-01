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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: teamMembers.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (context, index) {
            final member = teamMembers[index];
          
          child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF162238),
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: const EdgeInsets.all(14),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(18),
                      ),
                    ),
                  ],
                ),
          );
          },         
        ),
      ),
    );
  }
}