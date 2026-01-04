import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uas_flutter_jawa/detail/C++.dart';
import 'package:uas_flutter_jawa/detail/GO.dart';
import 'package:uas_flutter_jawa/detail/JAVA.dart';
import 'package:uas_flutter_jawa/detail/JS.dart';
import 'package:uas_flutter_jawa/detail/PY.dart';
import 'package:uas_flutter_jawa/detail/RUST.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  String? userName;
  bool isLoading = true;

  // ===== JUMLAH MATERI TIAP BAHASA =====
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

  // ===== HEADER =====
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

  // ===== INTRO =====
  Widget _introText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isLoading
            ? const Text('Loading...', style: TextStyle(color: Colors.white70))
            : Text(
                'Piye kabare, $userName 👋',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
        const SizedBox(height: 8),
        const Text(
          'Buka skill baru mu dengan belajar di CodeJawa 😎 semua materi pemrograman dari pemula sampai lanjutan ada disini',
          style: TextStyle(color: Colors.white60, fontSize: 14, height: 1.5),
        ),
      ],
    );
  }

  // ===== INFO BOX =====
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

