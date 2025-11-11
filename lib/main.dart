import 'package:examen/themes/index.dart';
import 'package:examen/view/home.dart';
import 'package:examen/view/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme Demo',
      debugShowCheckedModeBanner: false,
      theme: getGeneralTheme(Brightness.light),
      routes: {
        '/': (context) => const Home(),
        '/result': (context) => const Result(),
      },
      initialRoute: '/',
    );
  }
}