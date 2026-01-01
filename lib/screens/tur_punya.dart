import 'package:flutter/material.dart';

class Tur extends StatelessWidget {
  const Tur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: const [
                    Icon(Icons.arrow_back),
                    SizedBox(width: 8),
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('images/Tur.jpg'),
              ),

              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    colors: [Colors.purple.shade200, Colors.purple.shade50],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Muhammad Turtusi Afrizal Perdana",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "NIM: 1123150012\n"
                      "Kelas: TI SE 23 P1\n"
                      "Prodi: Teknik Informatika\n"
                      "Fakultas: Teknik dan Ilmu Komputer\n"
                      "Jurusan: Software Engineering\n"
                      "Kampus: Global Intitute of Technology & Business",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
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
}
