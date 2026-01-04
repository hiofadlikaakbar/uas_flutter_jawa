import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Java extends StatefulWidget {
  const Java({super.key});

  @override
  State<Java> createState() => _JavaState();
}

class _JavaState extends State<Java> {
  int selectedIndex = 0;
  bool isSaving = false;

  final List<Map<String, String>> lessons = [
    {
      "title": "Hello World",
      "subtitle": "Program pertama Java",
      "code": '''
public class Main {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
''',
      "explain":
          "Setiap program Java dimulai dari method main(). System.out.println() digunakan untuk menampilkan teks.",
    },
    {
      "title": "Variabel",
      "subtitle": "Menyimpan data",
      "code": '''
public class Main {
    public static void main(String[] args) {
        String nama = "CodeJawa";
        int umur = 20;

        System.out.println(nama);
        System.out.println(umur);
    }
}
''',
      "explain":
          "Variabel digunakan untuk menyimpan data. Java menggunakan tipe data seperti int dan String.",
    },
    {
      "title": "If Else",
      "subtitle": "Percabangan",
      "code": '''
public class Main {
    public static void main(String[] args) {
        int nilai = 80;

        if (nilai >= 75) {
            System.out.println("Lulus");
        } else {
            System.out.println("Tidak Lulus");
        }
    }
}
''',
      "explain":
          "If else digunakan untuk mengambil keputusan berdasarkan kondisi tertentu.",
    },
    {
      "title": "Loop For",
      "subtitle": "Perulangan",
      "code": '''
public class Main {
    public static void main(String[] args) {
        for (int i = 1; i <= 5; i++) {
            System.out.println("Loop ke-" + i);
        }
    }
}
''',
      "explain":
          "Loop for digunakan untuk menjalankan kode secara berulang dengan jumlah tertentu.",
    },
    {
      "title": "Method",
      "subtitle": "Fungsi di Java",
      "code": '''
public class Main {

    static void sapa() {
        System.out.println("Halo dari method!");
    }

    public static void main(String[] args) {
        sapa();
    }
}
''',
      "explain":
          "Method adalah kumpulan kode yang bisa dipanggil berulang kali agar program lebih rapi.",
    },
  ];

  // ================= SUPABASE =================
  Future<void> saveProgress() async {
    final supabase = Supabase.instance.client;
    final user = supabase.auth.currentUser;

    if (user == null) return;

    setState(() => isSaving = true);

    await supabase.from('lesson_progress').upsert({
      'user_id': user.id,
      'language': 'java',
      'lesson_index': selectedIndex,
    });

    if (!mounted) return;

    setState(() => isSaving = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Materi Java ditandai selesai ✅")),
    );
  }
  // ============================================

  @override
  Widget build(BuildContext context) {
    final lesson = lessons[selectedIndex];

    return Scaffold(
      backgroundColor: const Color(0xFF0B1623),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // HEADER
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

              // KONTEN
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

                    _finishButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= UI =================
  Widget _header(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        Image.asset('../../images/JAVA.png', height: 36),
        const SizedBox(width: 10),
        const Text(
          "Java",
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
          return ListTile(
            dense: true,
            onTap: () {
              setState(() => selectedIndex = index);
            },
            leading: Icon(
              active ? Icons.play_circle : Icons.circle_outlined,
              color: active ? const Color(0xFF00DDF8) : Colors.white38,
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
                "Kode Java",
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
            width: double.infinity,
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

  Widget _finishButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00DDF8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: isSaving ? null : saveProgress,
        child: isSaving
            ? const CircularProgressIndicator(color: Colors.black)
            : const Text(
                "Tandai Selesai",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}

// ===== helper widgets =====
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
