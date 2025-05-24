import 'package:fitfoxie/pages/home.dart';
import 'package:fitfoxie/pages/results.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          surface: const Color(0xFF1e1e1e),
          primary: const Color(0xFFDF643C),
          secondary: const Color(0xFFEF534F),
          inverseSurface: const Color(0xFFFFCDD2),
          outline: const Color(0xFFFDD054)),
      ),
      home: Home(),
      routes: {
        '/home': (context) => Home(),
        '/results': (context) => Results(),
      },
    );
  }
}
