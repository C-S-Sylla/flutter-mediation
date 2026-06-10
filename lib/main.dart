import 'package:flutter/material.dart';
import 'screens/list_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/form_screen.dart';
import 'screens/about_screen.dart';
import 'screens/login_screen.dart';

void main() => runApp(const MediationApp());

class MediationApp extends StatelessWidget {
  const MediationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Médiation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00695C)),
        useMaterial3: true,
      ),
    initialRoute: '/login',
    routes: {
      '/login': (context) => const LoginScreen(),
      '/': (context) => const ListScreen(),
      '/detail': (context) => const DetailScreen(),
      '/form': (context) => const FormScreen(),
      '/about': (context) => const AboutScreen(),
    },
    );
  }
}