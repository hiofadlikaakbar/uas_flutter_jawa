import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uas_flutter_jawa/dashboard/dahboard_profile.dart';
import 'package:uas_flutter_jawa/dashboard/dashboard.dart';
import 'package:uas_flutter_jawa/screens/login.dart';
import 'package:uas_flutter_jawa/screens/signup.dart';
import 'package:uas_flutter_jawa/screens/splash_screen3.dart';
import 'package:uas_flutter_jawa/screens/splash_screen4.dart';
import 'screens/splash_screen.dart';
import 'screens/splash_screen2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://qepadldcyhysdbwyxydk.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFlcGFkbGRjeWh5c2Rid3l4eWRrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjY5MzAzMDgsImV4cCI6MjA4MjUwNjMwOH0.r7VgIjgJNhgr1iPptshrQk3inv39oiWZZpvVUs-ZUlU',
  );

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mulai Belajar",
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/splash2': (context) => const SplashScreen2(),
        '/splash3': (context) => const SplashScreen3(),
        '/splash4': (context) => const SplashScreen4(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/dashboard': (context) => const MyDashboard(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/dashboard_profile') {
          return PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) {
              return const DashboardProfile();
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final slide = Tween<Offset>(
                begin: const Offset(0, 0.1),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOut,
                ),
              );

              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: slide,
                  child: child,
                ),
              );
            },
          );
        }
      },
    );
  }
}
