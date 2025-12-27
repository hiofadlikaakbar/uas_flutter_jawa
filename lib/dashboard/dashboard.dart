import 'package:flutter/material.dart';
import 'package:uas_flutter_jawa/detail/C++.dart';
import 'package:uas_flutter_jawa/detail/GO.dart';
import 'package:uas_flutter_jawa/detail/JAVA.dart';
import 'package:uas_flutter_jawa/detail/JS.dart';
import 'package:uas_flutter_jawa/detail/PY.dart';
import 'package:uas_flutter_jawa/detail/RUST.dart';

class MyDashboard extends StatelessWidget {
  const MyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1623),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              const SizedBox(height: 24),
              _introText(),
              const SizedBox(height: 24),
              _infoSection(),
              const SizedBox(height: 24),
              Expanded(child: _courseList(context)),
            ],
          ),
        ),
      ),
    );
  }

  // header
  Widget _header() {
    return Row(
      children: [
        const Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        _circleIcon(Icons.notifications),
        const SizedBox(width: 10),
        _circleIcon(Icons.person),
      ],
    );
  }

  Widget _circleIcon(IconData icon) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: Colors.white10,
      child: Icon(icon, color: Colors.white),
    );
  }

  // intro text
  Widget _introText() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 520),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Pilih Bahasa Pemrograman',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Buka skill baru mu dengan belajar di CodeJawa 😎 semua materi pemrograman dari pemula sampai lanjutan ada disini',
            maxLines: 3,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white60, fontSize: 14, height: 1.5),
          ),
        ],
      ),
    );
  }

  // info
  Widget _infoSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        InfoBox(value: "50+", label: "Pelajaran"),
        InfoBox(value: "1K", label: "Pengguna"),
        InfoBox(value: "10", label: "Bahasa"),
      ],
    );
  }

  // List kursus
  Widget _courseList(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        CourseCard(
          title: "C++",
          image: '../../images/C++.png',
          level: "Lanjutan",
          levelColor: Colors.red,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CPP()),
          ),
        ),
        CourseCard(
          title: "Python",
          image: '../../images/PY.png',
          level: "Pemula",
          levelColor: Colors.green,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const Python()),
          ),
        ),
        CourseCard(
          title: "JavaScript",
          image: '../../images/JS.png',
          level: "Pemula",
          levelColor: Colors.green,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const Js()),
          ),
        ),
        CourseCard(
          title: "Java",
          image: '../../images/JAVA.png',
          level: "Menengah",
          levelColor: Colors.orange,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const Java()),
          ),
        ),
        CourseCard(
          title: "Go",
          image: '../../images/GO.png',
          level: "Menengah",
          levelColor: Colors.orange,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const Go()),
          ),
        ),
        CourseCard(
          title: "Rust",
          image: '../../images/Rust.png',
          level: "Lanjutan",
          levelColor: Colors.red,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const Rust()),
          ),
        ),
      ],
    );
  }
}

// komponen
class CourseCard extends StatelessWidget {
  final String title;
  final String image;
  final String level;
  final Color levelColor;
  final VoidCallback onTap;

  const CourseCard({
    super.key,
    required this.title,
    required this.image,
    required this.level,
    required this.levelColor,
    required this.onTap,
  });

  // komponen kontainer bahasa pemrograman
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Image.asset(image, width: 54),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "24 Pelajaran",
                    style: TextStyle(color: Colors.white60),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: levelColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                level,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// komponen infobox kontainer
class InfoBox extends StatelessWidget {
  final String value;
  final String label;

  const InfoBox({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(14),
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
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.white60)),
        ],
      ),
    );
  }
}
