import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileIhza extends StatefulWidget {
  const ProfileIhza({super.key});

  @override
  State<ProfileIhza> createState() => _ProfileIhzaState();
}

class _ProfileIhzaState extends State<ProfileIhza>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(_fade);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _animated(Widget child) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(position: _slide, child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
            child: Hero(
              tag: "ihza-photo",
              child: Image.asset(
                "assets/images/ihzawa.png",
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
                  colors: [Colors.transparent, Colors.black.withOpacity(0.85)],
                ),
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

          Positioned(top: 380, left: 20, child: _animated(_searchTag())),
          Positioned(top: 280, right: 20, child: _animated(_followTag())),

          Positioned(
            top: size.height * 0.60,
            left: 20,
            child: _animated(_photoProfile()),
          ),

          Positioned(
            top: size.height * 0.50,
            right: 20,
            child: _animated(_keahliaan()),
          ),

          Positioned(
            top: size.height * 0.68,
            right: 20,
            child: _animated(_bornInfo()),
          ),

          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: _animated(_bottomName()),
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
            style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _infoCard({required String title, required String content}) {
    return Container(
      width: 190,
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
            style: GoogleFonts.inter(color: Colors.white60, fontSize: 12),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: GoogleFonts.inter(color: Colors.white, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _followTag() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 200),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "Follow Me!",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "@onlyyyzaa",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(color: Colors.white70, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _photoProfile() {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "PHOTO PROFIL",
            style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/images/ihza.jpg",
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _keahliaan() {
    return _infoCard(
      title: "Keahlian",
      content: "FLUTTER - LARAVEL - PHP\nHTML - CSS - MYSQL\nSUPABASE",
    );
  }

  Widget _bornInfo() {
    return _infoCard(
      title: "Born",
      content: "05 September 2005 (age 20)\nPurbalingga, Indo",
    );
  }

  Widget _bottomName() {
    return Column(
      children: [
        Text(
          "津田 健次郎",
          style: GoogleFonts.inter(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 40, height: 1, color: Colors.white),
            const SizedBox(width: 12),
            Text(
              "IHZA ANASRULLOH",
              style: GoogleFonts.inter(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.5,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 12),
            Container(width: 40, height: 1, color: Colors.white),
          ],
        ),
      ],
    );
  }
}
