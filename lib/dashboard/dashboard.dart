import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uas_flutter_jawa/constants.dart';
import 'package:uas_flutter_jawa/widget/bottom_nav_bar.dart';
import 'package:uas_flutter_jawa/widget/categorycard.dart';

class MyDashboard extends StatelessWidget {
  const MyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.45,
            decoration: const BoxDecoration(
              color: Color(0xFF0F2027),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0F2027),
                  Color(0xFF203A43),
                  Color(0xFF2C5364),
                ],
              ),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage(''),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: const Color(0xFF00DDF8).withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: const Color(0xFF00DDF8).withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.menu, color: Colors.white, size: 24),
                      ),
                    ],
                  ),

                  Text(
                    "Selamat Datang \ndi \nCodeLearnJawa",
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.5),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          size: 24,
                        ),
                        hintText: "Cari Kursus",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: .85,
                      children: <Widget>[
                        CategoryCard(
                          title: 'C++ ',
                          image: '../../images/C++.png',
                          press: () {},
                        ),
                        CategoryCard(
                          title: 'Python ',
                          image: '../../images/PY.png',
                          press: () {},
                        ),
                        CategoryCard(
                          title: 'JavaScript',
                          image: '../../images/JS.png',
                          press: () {},
                        ),
                        CategoryCard(
                          title: 'Java ',
                          image: '../../images/JAVA.png',
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
