import 'package:flutter/material.dart';
import 'package:project_shop/login.dart';
import 'package:project_shop/nevigation.dart';
void main_new() {
  runApp(const MainNewApp());
}

class MainNewApp extends StatelessWidget {
  const MainNewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Nevigation(),
      
    );
  }
}
