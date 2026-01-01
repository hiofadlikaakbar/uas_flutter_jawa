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
            top: 90,
            left: 20,
            child: Text(
              "Ihza\nGanteng",
              style: GoogleFonts.inter(
                fontSize: 80,
                height: 0.9,
                fontWeight: FontWeight.w900,
                letterSpacing: -2,
                color: Colors.white.withOpacity(0.08),
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
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.85),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            top: 300,
            left: 20,
            child: _searchTag(),
          ),

          Positioned(
            top: 120,
            right: 20,
            child: _followTag(),
          ),
          
                const SizedBox(height: 20),
                Row(
                  children: [
                    _infoCard(
                      title: "JAWARA 1",
                      content:
                          "WEB DEVELOPER\nFLUTTER\nPYTHON\nLARAVEL\nPHP\nMYSQL",
                    ),
                    const SizedBox(width: 12),
                    _infoCard(
                      title: "Born",
                      content: "5 September 2005\nPurbalingga\nIndonesia",
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                Text(
                  "津田 健次郎",
                  style: GoogleFonts.inter(
                    color: Colors.white60,
                    fontSize: 14,
                    letterSpacing: 1,
                  ),
                ),
                Text(
                  "IHZA ANASRULLOH",
                  style: GoogleFonts.inter(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.5,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
  }
  Widget _searchTag() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, size: 14),
          const SizedBox(width: 6),
          Text(
            "The Aligator",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 13,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                color: Colors.white60,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _followTag() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
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
        const SizedBox(width: 10),
        Text(
          "@onlyyyzaa",
          style: GoogleFonts.inter(
            color: Colors.white70,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
