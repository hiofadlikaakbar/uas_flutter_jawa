import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Js extends StatelessWidget {
  const Js({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1623),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Image.asset('../../images/JS.png', height: 36),
                    const SizedBox(width: 10),
                    const Text(
                      "JavaScript",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const Text("1/1", style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ),

              // konten
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                color: const Color(0xFF0B1623),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle("Daftar Pelajaran"),
                    _card(
                      child: ListTile(
                        dense: true,
                        leading: const Icon(
                          Icons.play_circle,
                          color: Color(0xFF00DDF8),
                        ),
                        title: const Text(
                          "Hello World",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: const Text(
                          "Program pertama JavaScript",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    _sectionTitle("Hello World"),
                    _subtitle("Program pertama JavaScript"),

                    const SizedBox(height: 16),

                    // blok kode
                    _card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Kode JavaScript",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.copy,
                                  color: Colors.white70,
                                ),
                                onPressed: () {
                                  Clipboard.setData(
                                    const ClipboardData(
                                      text: '''console.log("Hello, World!");
console.log("Selamat belajar JavaScript!");''',
                                    ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Kode disalin"),
                                    ),
                                  );
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
                              child: const Text(
                                '''console.log("Hello, World!");
console.log("Selamat belajar JavaScript!");''',
                                style: TextStyle(
                                  color: Color(0xFF00DDF8),
                                  fontFamily: 'monospace',
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // penjelasan materi
                    _card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Penjelasan",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "JavaScript adalah bahasa pemrograman yang "
                            "digunakan untuk membuat website interaktif. "
                            "Fungsi console.log() digunakan untuk "
                            "menampilkan teks ke console browser.",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // tombol selesai belajar
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00DDF8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Tandai Selesai",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
