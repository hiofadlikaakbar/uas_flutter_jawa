import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileIhza extends StatelessWidget {
  const ProfileIhza({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1623),
      body: Stack(
        children: [
          Positioned(
            top: 120,
            left: 16,
            child: Text(
              "Ihza\nGanteng",
              style: GoogleFonts.inter(
                fontSize: 76,
                height: 0.95,
                fontWeight: FontWeight.w900,
                letterSpacing: -2,
                color: Colors.white.withOpacity(0.07),
              ),
            ),
          ),
          Positioned.fill(
            child: Transform.scale(
              scale: 1,
              child: Image.asset(
                "images/ihzawa.png",
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "The Aligator",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 14),

                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Follow Me!",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "@onlyyyzaa",
                      style: GoogleFonts.inter(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _infoCard(
                      title: "Famous roles",
                      content:
                          "Seto Kaiba (Yu-Gi-Oh!)\nNanami Kento (Jujutsu Kaisen)\nOverhaul (My Hero Academia)",
                    ),
                    const SizedBox(width: 12),
                    _infoCard(
                      title: "Born",
                      content: "11 June 1971\nOsaka Prefecture\nJapan",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoCard({required String title, required String content}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF162238),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
