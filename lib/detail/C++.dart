import 'package:flutter/material.dart';

class CPP extends StatelessWidget {
  const CPP({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 0.45,
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
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                height: size.height * 0.40,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Row(
                        children: [
                          _circleIcon(Icons.notifications),
                          const SizedBox(width: 12),
                          _circleIcon(Icons.menu),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "C++",
                                style: Theme.of(context).textTheme.displayMedium
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                    ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                "C++ adalah bahasa pemrograman\n"
                                "cepat dan kuat untuk membuat\n"
                                "aplikasi berperforma tinggi.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset(
                            '../../images/C++.png',
                            width: 150,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _circleIcon(IconData icon) {
  return Container(
    height: 48,
    width: 48,
    decoration: BoxDecoration(
      color: const Color(0xFF00DDF8).withOpacity(0.2),
      shape: BoxShape.circle,
    ),
    child: Icon(icon, color: Colors.white, size: 24),
  );
}
