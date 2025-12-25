import 'package:flutter/material.dart';

class CPP extends StatelessWidget {
  const CPP({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF0B1623),
      body: Stack(
        children: [
          Container(
            height: size.height * 0.32,
            decoration: BoxDecoration(
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
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Image(
                            image: AssetImage('../../images/c++.png'),
                            height: 40,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'C++',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Text("0/1 Selesai",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          )
                        ),
                      ],
                    ),
                    
                  const SizedBox(height: 20),

                  _sectionTitle('Daftar Pelajaran'),
                  _card(
                    child : ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xFF203A43),
                        child: Text("1",
                          style: TextStyle(color: Colors.white)),
                      ),
                      title: const Text("Hello World",
                        style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold),
                        ),
                      subtitle: const Text("Program pertama dalam C++",
                        style: TextStyle(color: Colors.white70),
                        ),
                        trailing: const Icon(Icons.chevron_right,
                          color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _card({required Widget child}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Color(0xFF1E2A38),
      borderRadius: BorderRadius.circular(16),
    ),
    child: child,
  );
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