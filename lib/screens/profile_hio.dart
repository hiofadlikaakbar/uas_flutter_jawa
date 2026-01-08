import 'package:flutter/material.dart';

class ProfileHio extends StatelessWidget {
  const ProfileHio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF070B16),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.cyanAccent,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// AVATAR WITH NEON GLOW
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Colors.cyanAccent, Colors.purpleAccent],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyanAccent.withOpacity(0.6),
                    blurRadius: 25,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage("assets/images/jawa_leader.png"),
              ),
            ),

            const SizedBox(height: 20),

            /// NAME
            const Text(
              "HIO FADLIKA AKBAR",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.cyanAccent,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),

            const SizedBox(height: 6),

            /// ROLE
            const Text(
              "1123150077 | TI 23 SE 1",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),

            const SizedBox(height: 28),

            /// ABOUT ME
            _neonCard(
              title: "ABOUT ME",
              child: const Text(
                "Yo, my name is Hio Fadlika Akbar, people often call me Akbar, I'm a self-taught programmer who really enjoys learning and growing in my craft. My curiosity keeps me motivated to dive into new technologies and come up with unique solutions. I love starting from scratch to build applications and user interfaces, turning ideas into real, working products. Each project feels like a chance to innovate, improve my abilities, and create the best experience for users.",
                style: TextStyle(color: Colors.white70, height: 1.5),
              ),
            ),

            const SizedBox(height: 16),

            /// LOCATION & FOCUS (NO EXPANDED!)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: _neonCard(
                    title: "LOCATION",
                    child: const Text(
                      "Indonesia",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Flexible(
                  fit: FlexFit.loose,
                  child: _neonCard(
                    title: "FOCUS",
                    child: const Text(
                      "Fullstack Developer",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// SKILLS
            _neonCard(
              title: "Techstack",
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: const [
                  _SkillChip("Flutter"),
                  _SkillChip("Dart"),
                  _SkillChip("Tailwind"),
                  _SkillChip("Supabase"),
                  _SkillChip("Firebase"),
                  _SkillChip("Vue"),
                  _SkillChip("Node.js"),
                  _SkillChip("UI/UX"),
                  _SkillChip("Git"),
                ],
              ),
            ),

            const SizedBox(height: 28),

            /// FOOTER
            const Text(
              "Never Give up",
              style: TextStyle(color: Colors.white38, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  /// NEON CARD WIDGET
  static Widget _neonCard({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1324),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.cyanAccent.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.cyanAccent.withOpacity(0.15),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.cyanAccent,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

/// SKILL CHIP
class _SkillChip extends StatelessWidget {
  final String label;
  const _SkillChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Colors.cyanAccent, Colors.purpleAccent],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.purpleAccent.withOpacity(0.4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
