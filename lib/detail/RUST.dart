import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Rust extends StatefulWidget {
  const Rust({super.key});

  @override
  State<Rust> createState() => _RustState();
}

class _RustState extends State<Rust> {
  int selectedIndex = 0;
  bool isSaving = false;

  final supabase = Supabase.instance.client;

  // ===== 3 MATERI RUST =====
  final List<Map<String, String>> lessons = [
    {
      "title": "Hello World",
      "subtitle": "Program pertama Rust",
      "code": '''
fn main() {
    println!("Hello, World!");
}
''',
      "explain":
          "Program Rust selalu dimulai dari fungsi main(). println! digunakan untuk menampilkan teks ke layar.",
    },
    {
      "title": "Variabel",
      "subtitle": "let dan mut",
      "code": '''
fn main() {
    let mut angka = 10;
    angka = 20;
    println!("{}", angka);
}
''',
      "explain":
          "Secara default variabel Rust bersifat immutable. Gunakan mut agar bisa diubah.",
    },
    {
      "title": "If Else",
      "subtitle": "Percabangan logika",
      "code": '''
fn main() {
    let nilai = 80;

    if nilai >= 75 {
        println!("Lulus");
    } else {
        println!("Tidak Lulus");
    }
}
''',
      "explain":
          "If else digunakan untuk pengambilan keputusan berdasarkan kondisi tertentu.",
    },
  ];

  // ===== PROGRESS =====
  Set<int> completedLessons = {};

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  // ===== LOAD PROGRESS =====
  Future<void> _loadProgress() async {
    final user = supabase.auth.currentUser;
    if (user == null) return;

    final res = await supabase
        .from('lesson_progress')
        .select('lesson_index')
        .eq('user_id', user.id)
        .eq('language', 'rust');

    if (!mounted) return;

    setState(() {
      completedLessons =
          res.map<int>((e) => e['lesson_index'] as int).toSet();
    });
  }


  @override
  Widget build(BuildContext context) {
    final lesson = lessons[selectedIndex];
    final isCompleted = completedLessons.contains(selectedIndex);

    return Scaffold(
      backgroundColor: const Color(0xFF0B1623),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ===== HEADER =====
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF0F2027),
                      Color(0xFF203A43),
                      Color(0xFF2C5364),
                    ],
                  ),
                ),
                child: _header(context),
              ),


