import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_shop/login.dart';
import 'package:project_shop/nevigation.dart';
import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
import 'package:project_shop/nevigation_new.dart';
Future<void> main_new()async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainNewApp());
}

class MainNewApp extends StatelessWidget {
  const MainNewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      
      
      home: Nevigation(),
      // home: Test(),
    );
  }
}
