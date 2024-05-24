import 'package:flutter/material.dart';
import 'package:technews/pages/homepage.dart';
import 'package:technews/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark, primaryColor: AppColors.primary
      ),
      home: const HomePage(),
    );
  }
}