import 'package:flutter/material.dart';

class LayoutFinalPage extends StatelessWidget {
  const LayoutFinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: size.height),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Muhammad Turtusi Afrizal Perdana",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontFamily: 'RobotoMono',
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "1123150012",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: const [
                          Text(
                            "Software Engineering",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(width: 30),
                          Icon(
                            Icons.location_on,
                            color: Colors.white70,
                            size: 16,
                          ),
                          SizedBox(width: 2),
                          Text(
                            "Cilongok City",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                              fontFamily: 'RobotoMono',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          W1(title: "Followers", value: "1K"),
                          W1(title: "Following", value: "2K"),
                          W1(title: "Projects", value: "2"),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Tentang Saya",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'RobotoMono',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 7),
                      const Text(
                        "Halo, nama saya Muhammad Turtusi Afrizal Perdana. "
                        "Saya adalah seorang mahasiswa jurusan Software Engineering "
                        "di Institute Teknologi & Bisnis Bina Sarana Global. "
                        "Saya memiliki minat yang besar "
                        "dalam pengembangan perangkat lunak dan selalu bersemangat "
                        "untuk belajar teknologi baru. Saya senang bekerja dalam tim "
                        "dan berkontribusi pada proyek-proyek yang menantang.",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Yang saya Kerjakan Pada APK ini adalah :",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 7),
                      const Text(
                        " - membuat Splash Screen,\n"
                        "pada splash screen, saya menambahkan logo, text dan juga button\n"
                        " - membuat Dashboard\n"
                        "pada dashboard, saya membuat seluruh tampilan awal "
                        " dashboard. Mulai dari menambahkan Icon, Logo setiap framework dll,\n"
                        " - membuat Profile Screen,\n"
                        "pada profile screen, saya membuat tampilan profile seperti yang anda lihat saat ini,\n",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Projects",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'RobotoMono',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 7),
                      const Text(
                        "- First Project       : A Web Profile brand 'PHD Trans' .\n"
                        "- Second Project  : A Website for E-Commerce\n"
                        "- Third Project      : A Faculty Web .\n"
                        "- Fourth Project    : A Website brand 'Nona Market' for Online Shopping .\n"
                        "- Fifth Project       : An e-commerce platform with integrated payment gateway.\n",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 75),
                      const Text(
                        'TOOLS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 5,
                        children: const [
                          Chip(
                            label: Text(
                              'VS Code',
                              style: TextStyle(fontFamily: 'RobotoMono'),
                            ),
                          ),
                          Chip(
                            label: Text(
                              'Figma',
                              style: TextStyle(fontFamily: 'RobotoMono'),
                            ),
                          ),
                          Chip(
                            label: Text(
                              'GitHub',
                              style: TextStyle(fontFamily: 'RobotoMono'),
                            ),
                          ),
                          Chip(
                            label: Text(
                              'Xampp',
                              style: TextStyle(fontFamily: 'RobotoMono'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class W1 extends StatelessWidget {
  final String title;
  final String value;

  const W1({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(color: Colors.white70, fontFamily: 'Poppins'),
        ),
      ],
    );
  }
}
