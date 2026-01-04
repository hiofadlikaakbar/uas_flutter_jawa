import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CPP extends StatefulWidget {
  const CPP({super.key});

  @override
  State<CPP> createState() => _CPPState();
}

class _CPPState extends State<CPP> {
  int selectedIndex = 0;
  bool isCompleted = false;

  final supabase = Supabase.instance.client;

  // ===== LIST MATERI C++ =====
  final List<Map<String, String>> lessons = [
    {
      "title": "Hello World",
      "subtitle": "Program pertama dalam C++",
      "code": '''
#include <iostream>
using namespace std;

int main() {
    cout << "Hello, World!" << endl;
    return 0;
}
''',
      "explain":
          "Program dasar C++ menggunakan cout untuk menampilkan teks ke layar.",
    },
    {
      "title": "Variabel",
      "subtitle": "Menyimpan data dalam variabel",
      "code": '''
#include <iostream>
using namespace std;

int main() {
    string nama = "CodeJawa";
    int umur = 20;

    cout << nama << endl;
    cout << umur << endl;
    return 0;
}
''',
      "explain":
          "Variabel digunakan untuk menyimpan data seperti angka dan teks.",
    },
    {
      "title": "Input Output",
      "subtitle": "Mengambil input dari user",
      "code": '''
#include <iostream>
using namespace std;

int main() {
    int angka;
    cin >> angka;
    cout << angka;
    return 0;
}
''',
      "explain":
          "cin digunakan untuk menerima input dari user melalui keyboard.",
    },
    {
      "title": "If Else",
      "subtitle": "Percabangan logika",
      "code": '''
#include <iostream>
using namespace std;

int main() {
    int nilai = 80;

    if (nilai >= 75) {
        cout << "Lulus";
    } else {
        cout << "Tidak Lulus";
    }
    return 0;
}
''',
      "explain":
          "If-else digunakan untuk pengambilan keputusan berdasarkan kondisi.",
    },
    {
      "title": "Loop For",
      "subtitle": "Perulangan dalam C++",
      "code": '''
#include <iostream>
using namespace std;

int main() {
    for (int i = 1; i <= 5; i++) {
        cout << i << endl;
    }
    return 0;
}
''',
      "explain":
          "Perulangan for digunakan untuk menjalankan kode secara berulang.",
    },
  ];

  @override
  void initState() {
    super.initState();
    _checkProgress();
  }

  // ===== CEK PROGRESS =====
  Future<void> _checkProgress() async {
    final user = supabase.auth.currentUser;
    if (user == null) return;

    final res = await supabase
        .from('lesson_progress')
        .select()
        .eq('user_id', user.id)
        .eq('language', 'cpp')
        .eq('lesson_index', selectedIndex)
        .maybeSingle();

    setState(() {
      isCompleted = res != null && res['completed'] == true;
    });
  }

  // ===== SIMPAN PROGRESS =====
  Future<void> _markCompleted() async {
    final user = supabase.auth.currentUser;
    if (user == null) return;

    await supabase.from('lesson_progress').upsert({
      'user_id': user.id,
      'language': 'cpp',
      'lesson_index': selectedIndex,
      'completed': true,
    });

    setState(() => isCompleted = true);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Materi C++ ditandai selesai ✅")),
    );
  }

  @override
  

  Widget _lessonList() {
    return _card(
      child: Column(
        children: List.generate(lessons.length, (index) {
          final active = index == selectedIndex;

          return ListTile(
            dense: true,
            onTap: () {
              setState(() => selectedIndex = index);
              _checkProgress();
            },
            leading: Icon(
              active
                  ? (isCompleted ? Icons.check_circle : Icons.play_circle)
                  : Icons.circle_outlined,
              color: isCompleted ? Colors.greenAccent : const Color(0xFF00DDF8),
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
          backgroundColor: isCompleted ? Colors.green : const Color(0xFF00DDF8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: isCompleted ? null : _markCompleted,
        child: Text(
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

Widget _sectionTitle(String title) {
  return Padding(
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
}

Widget _subtitle(String text) {
  return Text(
    text,
    style: const TextStyle(color: Colors.white70, fontSize: 14),
  );
}

Widget _card({required Widget child}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFF1E2A38),
      borderRadius: BorderRadius.circular(16),
    ),
    child: child,
  );
}
