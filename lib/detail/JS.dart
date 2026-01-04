import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Js extends StatefulWidget {
  const Js({super.key});

  @override
  State<Js> createState() => _JsState();
}

class _JsState extends State<Js> {
  int selectedIndex = 0;
  bool isSaving = false;

  final supabase = Supabase.instance.client;

  // ===== LIST 10 MATERI JAVASCRIPT =====
  final List<Map<String, String>> lessons = [
    {
      "title": "Hello World",
      "subtitle": "Program pertama JavaScript",
      "code": '''
console.log("Hello, World!");
''',
      "explain":
          "console.log() digunakan untuk menampilkan output ke console browser.",
    },
    {
      "title": "Variabel",
      "subtitle": "let dan const",
      "code": '''
let nama = "CodeJawa";
const umur = 20;

console.log(nama);
console.log(umur);
''',
      "explain":
          "let digunakan untuk variabel yang bisa berubah, const untuk nilai tetap.",
    },
    {
      "title": "Tipe Data",
      "subtitle": "String, Number, Boolean",
      "code": '''
let teks = "Halo";
let angka = 10;
let benar = true;

console.log(typeof teks);
console.log(typeof angka);
console.log(typeof benar);
''',
      "explain":
          "JavaScript memiliki berbagai tipe data seperti string, number, dan boolean.",
    },
    {
      "title": "Operator",
      "subtitle": "Aritmatika",
      "code": '''
let a = 10;
let b = 5;

console.log(a + b);
console.log(a * b);
''',
      "explain":
          "Operator digunakan untuk operasi matematika seperti tambah dan kali.",
    },
    {
      "title": "If Else",
      "subtitle": "Percabangan logika",
      "code": '''
let nilai = 80;

if (nilai >= 75) {
  console.log("Lulus");
} else {
  console.log("Tidak Lulus");
}
''',
      "explain":
          "If else digunakan untuk pengambilan keputusan berdasarkan kondisi.",
    },
    {
      "title": "Switch",
      "subtitle": "Percabangan banyak kondisi",
      "code": '''
let hari = 1;

switch (hari) {
  case 1:
    console.log("Senin");
    break;
  default:
    console.log("Hari lain");
}
''',
      "explain":
          "Switch digunakan untuk memilih kondisi dari banyak kemungkinan.",
    },
    {
      "title": "Loop For",
      "subtitle": "Perulangan",
      "code": '''
for (let i = 1; i <= 5; i++) {
  console.log(i);
}
''',
      "explain": "Loop for digunakan untuk menjalankan kode berulang kali.",
    },
    {
      "title": "While",
      "subtitle": "Perulangan while",
      "code": '''
let i = 1;
while (i <= 5) {
  console.log(i);
  i++;
}
''',
      "explain": "While loop berjalan selama kondisi bernilai true.",
    },
    {
      "title": "Function",
      "subtitle": "Membuat fungsi",
      "code": '''
function sapa() {
  console.log("Halo dari function");
}

sapa();
''',
      "explain": "Function digunakan agar kode bisa dipanggil berulang.",
    },
    {
      "title": "Array",
      "subtitle": "Kumpulan data",
      "code": '''
let buah = ["Apel", "Mangga", "Jeruk"];
console.log(buah[0]);
''',
      "explain":
          "Array digunakan untuk menyimpan banyak data dalam satu variabel.",
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
        .eq('language', 'js');

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
      'language': 'js',
      'lesson_index': selectedIndex,
      'completed': true,
    });

    if (!mounted) return;

    setState(() {
      completedLessons.add(selectedIndex);
      isSaving = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Materi JavaScript selesai ✅")),
    );
  }

 

 

 



