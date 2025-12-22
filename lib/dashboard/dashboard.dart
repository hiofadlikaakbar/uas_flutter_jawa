import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyDashboard extends StatelessWidget {
  const MyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
                image: AssetImage('images/jawa.gif'),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    alignment: Alignment.center,
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: Color(0xFF00DDF8).withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset("../../android/icons/Filter.svg"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
