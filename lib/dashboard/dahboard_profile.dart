import 'package:flutter/material.dart';

class DashboardProfile extends StatelessWidget {
  const DashboardProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> teamMembers = [
      {
        "name": "Hio Fadlika Akbar",
        "role": "KETUA PARA JAWA",
        "image": "assets/images/hio.jpeg",
        "route": "/profile_hio",
      },
      {
        "name": "Ihza Anasrulloh",
        "role": "JAWA 2",
        "image": "assets/images/ihza.jpg",
        "route": "/profile_ihza",
      },
      {
        "name": "Muhammad Turtusi Afrizal",
        "role": "JAWA 3",
        "image": "assets/images/1.4.jpeg",
        "route": "/tur_punya",
      },
      {
        "name": "Afnan Dani",
        "role": "JAWA 4",
        "image": "assets/images/afnan.jpeg",
        "route": "/profile_afnan",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0B1623),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          tooltip: '',
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Profil Tim",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
            childAspectRatio: 0.65, // 🔧 FIX
          ),
          itemBuilder: (context, index) {
            final member = teamMembers[index];

            return InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  member['route']!,
                  arguments: member,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF162238),
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // IMAGE
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.asset(member['image']!, fit: BoxFit.cover),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // NAME
                    Text(
                      member['name']!,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    // ROLE
                    Text(
                      member['role']!,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
