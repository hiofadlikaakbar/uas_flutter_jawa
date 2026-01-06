import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Go extends StatefulWidget {
  const Go({super.key});

  @override
  State<Go> createState() => _GoState();
}

class _GoState extends State<Go> {
  int selectedIndex = 0;
  bool isSaving = false;

  final supabase = Supabase.instance.client;

  // ===== 3 MATERI GO =====
  final List<Map<String, String>> lessons = [
    {
      "title": "Hello World",
      "subtitle": "Program pertama Go",
      "code": '''
package main

import "fmt"

func main() {
    fmt.Println("Hello, World!")
}
''',
      "explain":
          "Program Go selalu dimulai dari fungsi main(). fmt.Println digunakan untuk mencetak teks ke layar.",
    },
    {
      "title": "Variabel",
      "subtitle": "Deklarasi variabel",
      "code": '''
package main

import "fmt"

func main() {
    var nama string = "CodeJawa"
    umur := 20
    fmt.Println(nama, umur)
}
''',
      "explain":
          "Go mendukung deklarasi variabel menggunakan var dan := untuk inferensi tipe otomatis.",
    },
    {
      "title": "If Else",
      "subtitle": "Percabangan kondisi",
      "code": '''
package main

import "fmt"

func main() {
    nilai := 80

    if nilai >= 75 {
        fmt.Println("Lulus")
    } else {
        fmt.Println("Tidak Lulus")
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
        .eq('language', 'go');

    if (!mounted) return;

    setState(() {
      completedLessons = res.map<int>((e) => e['lesson_index'] as int).toSet();
    });
  }

  // ===== SIMPAN PROGRESS =====
  Future<void> _markCompleted() async {
    final user = supabase.auth.currentUser;
    if (user == null) return;

    setState(() => isSaving = true);

    await supabase.from('lesson_progress').upsert({
      'user_id': user.id,
      'language': 'go',
      'lesson_index': selectedIndex,
      'completed': true,
    });

    if (!mounted) return;

    setState(() {
      completedLessons.add(selectedIndex);
      isSaving = false;
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Materi Go selesai ✅")));
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

              // ===== KONTEN =====
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                color: const Color(0xFF0B1623),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle("Daftar Pelajaran"),
                    _lessonList(),

                    const SizedBox(height: 24),

                    _sectionTitle(lesson["title"]!),
                    _subtitle(lesson["subtitle"]!),

                    const SizedBox(height: 16),

                    _codeBox(lesson["code"]!),

                    const SizedBox(height: 16),

                    _explainBox(lesson["explain"]!),

                    const SizedBox(height: 32),

                    _finishButton(isCompleted),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ===== UI =====
  Widget _header(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        Image.asset('assets/images/GO.png', height: 36),
        const SizedBox(width: 10),
        const Text(
          "Go",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Text(
          "${selectedIndex + 1}/${lessons.length}",
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }

  Widget _lessonList() {
    return _card(
      child: Column(
        children: List.generate(lessons.length, (index) {
          final active = index == selectedIndex;
          final done = completedLessons.contains(index);

          return ListTile(
            dense: true,
            onTap: () => setState(() => selectedIndex = index),
            leading: Icon(
              done
                  ? Icons.check_circle
                  : (active ? Icons.play_circle : Icons.circle_outlined),
              color: done ? Colors.greenAccent : const Color(0xFF00DDF8),
            ),
            title: Text(
              lessons[index]["title"]!,
              style: TextStyle(
                color: active ? Colors.white : Colors.white70,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _codeBox(String code) {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Kode Go",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.copy, color: Colors.white70),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: code));
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text("Kode disalin")));
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF121B26),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                code,
                style: const TextStyle(
                  color: Color(0xFF00DDF8),
                  fontFamily: 'monospace',
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _explainBox(String text) {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Penjelasan",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(color: Colors.white70, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _finishButton(bool isCompleted) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isCompleted
              ? Colors.grey.shade600
              : const Color(0xFF00DDF8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: (isCompleted || isSaving) ? null : _markCompleted,
        child: isSaving
            ? const CircularProgressIndicator(color: Colors.black)
            : Text(
                isCompleted ? "Sudah Selesai ✔" : "Tandai Selesai",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}

Widget _sectionTitle(String title) => Padding(
  padding: const EdgeInsets.only(bottom: 8),
  child: Text(
    title,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
);

Widget _subtitle(String text) =>
    Text(text, style: const TextStyle(color: Colors.white70, fontSize: 14));

Widget _card({required Widget child}) => Container(
  width: double.infinity,
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: const Color(0xFF1E2A38),
    borderRadius: BorderRadius.circular(16),
  ),
  child: child,
);
