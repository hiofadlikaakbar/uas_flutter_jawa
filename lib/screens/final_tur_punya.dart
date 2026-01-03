import 'package:flutter/material.dart';

class LayoutFinalPage extends StatelessWidget {
  const LayoutFinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Layout Final")),
      body: const Center(
        child: Text("INI HALAMAN LAYOUT FINAL", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
