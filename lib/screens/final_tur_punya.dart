import 'package:flutter/material.dart';

class LayoutFinalPage extends StatelessWidget {
  const LayoutFinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: size.height),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Muhammad Turtusi Afrizal Perdana",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontFamily: 'RobotoMono',
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Text(
                            "Dev Mobile",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                              fontFamily: 'RobotoMono',
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(
                            Icons.location_on,
                            color: Colors.white70,
                            size: 16,
                          ),
                          SizedBox(width: 2),
                          Text(
                            "Cilongok City",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                              fontFamily: 'RobotoMono',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
