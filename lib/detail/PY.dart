import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Python extends StatefulWidget {
  const Python({super.key});

  @override
  State<Python> createState() => _PythonState();
}

class _PythonState extends State<Python> {
  int selectedIndex = 0;

  // list materi python
  final List<Map<String, String>> lessons = [
    {
      "title": "Hello World",
      "subtitle": "Program pertama dalam Python",
      "code": '''
# Program pertama Python
print("Hello, World!")
print("Ini adalah python")
''',
      "explain":
          "print() adalah fungsi untuk menampilkan teks ke layar. "
          "Teks harus diapit tanda kutip.",
    },
    {
      "title": "Variable",
      "subtitle": "Menyimpan data dalam variabel",
      "code": '''
nama = "JawaKode"
umur = 20

print(nama)
print(umur)
''',
      "explain":
          "Variabel digunakan untuk menyimpan data. "
          "Python tidak perlu menentukan tipe data secara eksplisit.",
    },
    {
      "title": "If - Else",
      "subtitle": "Membuat keputusan dalam program",
      "code": '''
nilai = 80

if nilai >= 75:
    print("Lulus")
else:
    print("Tidak lulus")
''',
      "explain":
          "If-else digunakan untuk pengambilan keputusan "
          "berdasarkan kondisi tertentu.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final lesson = lessons[selectedIndex];
    return Scaffold(
      backgroundColor: const Color(0xFF0B1623),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // header
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

              // materi
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

                    // Judul materi yang dipilih
                    _sectionTitle(lesson["title"]!),
                    _subtitle(lesson["subtitle"]!),

                    const SizedBox(height: 16),

                    // Kotak kode Python
                    _codeBox(lesson["code"]!),

                    const SizedBox(height: 16),

                    // Penjelasan materi
                    _explainBox(lesson["explain"]!),

                    const SizedBox(height: 32),

                    // Tombol tandai selesai
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

  //  widget materi
  Widget _header(BuildContext context) {
    return Row(
      children: [
        // Tombol kembali
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),

        // Logo Python
        Image.asset("../../images/PY.png", height: 36),

        const SizedBox(width: 10),

        // Judul halaman
        const Text(
          "Python",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),

        const Spacer(),

        // Progress materi (contoh: 1/3)
        Text(
          "${selectedIndex + 1}/${lessons.length}",
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }

  // list materi
  Widget _lessonList() {
    return _card(
      child: Column(
        children: List.generate(lessons.length, (index) {
          // Mengecek apakah item ini aktif
          final active = index == selectedIndex;

          return ListTile(
            dense: true,

            // Ketika materi diklik
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },

            // Icon berbeda untuk materi aktif
            leading: Icon(
              active ? Icons.play_circle : Icons.circle_outlined,
              color: active ? const Color(0xFF00DDF8) : Colors.white38,
            ),

            // Judul materi
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

