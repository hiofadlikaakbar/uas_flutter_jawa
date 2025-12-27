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
            'Mulai perjalanan coding kamu dengan memilih bahasa yang ingin dipelajari. '
            'Setiap bahasa memiliki kelebihan dan kegunaannya masing-masing.',
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
        InfoBox(value: "170+", label: "Pelajaran"),
        InfoBox(value: "25K", label: "Pengguna"),
        InfoBox(value: "6", label: "Bahasa"),
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
