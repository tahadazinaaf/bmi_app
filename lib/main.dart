import 'package:bmi/home.dart';
import 'package:bmi/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.grey),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF03045e)),
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
      ),

      home: const MyHomePage(),
    );
  }
}
