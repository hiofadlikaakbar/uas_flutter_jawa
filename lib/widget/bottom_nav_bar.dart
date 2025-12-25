import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNavItem(
            image: '../../images/home.png',
            title: 'Home',
            press: () {},
          ),
          BottomNavItem(
            image: '../../images/book.png',
            title: 'All Exercise',
            isActive: true,
            press: () {},
          ),
          BottomNavItem(
            image: '../../images/user.png',
            title: 'Profile',
            press: () {},
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback press;
  final bool isActive;
  const BottomNavItem({
    super.key,
    required this.image,
    required this.title,
    required this.press,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image.asset(image, width: 30, height: 30),
          Text(
            title,
            style: TextStyle(color: isActive ? Colors.blue : Colors.black),
          ),
        ],
      ),
    );
  }
}
