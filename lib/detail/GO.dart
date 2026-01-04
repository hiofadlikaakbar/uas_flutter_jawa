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




