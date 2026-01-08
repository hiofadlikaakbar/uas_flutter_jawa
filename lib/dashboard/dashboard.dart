import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uas_flutter_jawa/detail/C++.dart';
import 'package:uas_flutter_jawa/detail/GO.dart';
import 'package:uas_flutter_jawa/detail/JAVA.dart';
import 'package:uas_flutter_jawa/detail/JS.dart';
import 'package:uas_flutter_jawa/detail/PY.dart';
import 'package:uas_flutter_jawa/detail/RUST.dart';
import 'package:uas_flutter_jawa/services/fcm-service.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  String? userName;
  bool isLoading = true;

  // jumlah materi
  final Map<String, int> lessonCount = {
    'C++': 5,
    'Python': 5,
    'JavaScript': 10,
    'Java': 5,
    'Go': 3,
    'Rust': 3,
  };

  int get totalLessons => lessonCount.values.fold(0, (sum, item) => sum + item);

  @override
  void initState() {
    super.initState();
    fetchUserName();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setupFcm();
      handleInitialMessage();
    });
  }

  Future<void> fetchUserName() async {
    final client = Supabase.instance.client;
    final user = client.auth.currentUser;

    if (user == null) {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/login');
      return;
    }

    final res = await client
        .from('profiles')
        .select('name')
        .eq('id', user.id)
        .single();

    if (!mounted) return;

    setState(() {
      userName = res['name'];
      isLoading = false;
    });
  }

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

        _circleIcon(
          Icons.person,
          onTap: () => Navigator.pushNamed(context, '/dashboard_profile'),
        ),
      ],
    );
  }

  Widget _circleIcon(IconData icon, {VoidCallback? onTap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: CircleAvatar(
        radius: 22,
        backgroundColor: Colors.white10,
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  Widget _introText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isLoading
            ? const Text('Loading...', style: TextStyle(color: Colors.white70))
            : Text(
                'Piye kabare, $userName',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
        const SizedBox(height: 8),
        const Text(
          'Buka skill baru mu dengan belajar di JawaCode semua materi pemrograman dari pemula sampai lanjutan ada disini',
          style: TextStyle(color: Colors.white60, fontSize: 14, height: 1.5),
        ),
      ],
    );
  }

  //  info box
  Widget _infoSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InfoBox(value: "$totalLessons", label: "Pelajaran"),
        const InfoBox(value: "1K+", label: "Pengguna"),
        const InfoBox(value: "6", label: "Bahasa"),
      ],
    );
  }

  //  course list
  Widget _courseList(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        CourseCard(
          title: "C++",
          image: 'assets/images/C++.png',
          level: "Lanjutan",
          levelColor: Colors.red,
          lessons: lessonCount['C++']!,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CPP()),
          ),
        ),
        CourseCard(
          title: "Python",
          image: 'assets/images/PY.png',
          level: "Pemula",
          levelColor: Colors.green,
          lessons: lessonCount['Python']!,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const Python()),
          ),
        ),
        CourseCard(
          title: "JavaScript",
          image: 'assets/images/JS.png',
          level: "Pemula",
          levelColor: Colors.green,
          lessons: lessonCount['JavaScript']!,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const Js()),
          ),
        ),
        CourseCard(
          title: "Java",
          image: 'assets/images/JAVA.png',
          level: "Menengah",
          levelColor: Colors.orange,
          lessons: lessonCount['Java']!,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const Java()),
          ),
        ),
        CourseCard(
          title: "Go",
          image: 'assets/images/GO.png',
          level: "Menengah",
          levelColor: Colors.orange,
          lessons: lessonCount['Go']!,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const Go()),
          ),
        ),
        CourseCard(
          title: "Rust",
          image: 'assets/images/Rust.png',
          level: "Lanjutan",
          levelColor: Colors.red,
          lessons: lessonCount['Rust']!,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const Rust()),
          ),
        ),
      ],
    );
  }
}

// course card
class CourseCard extends StatelessWidget {
  final String title;
  final String image;
  final String level;
  final Color levelColor;
  final int lessons;
  final VoidCallback onTap;

  const CourseCard({
    super.key,
    required this.title,
    required this.image,
    required this.level,
    required this.levelColor,
    required this.lessons,
    required this.onTap,
  });

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
                  Text(
                    "$lessons Pelajaran",
                    style: const TextStyle(color: Colors.white60),
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
