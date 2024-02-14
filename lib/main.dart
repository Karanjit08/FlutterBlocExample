import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/features/home/ui/home_screen.dart';


void main(){
  runApp(flutterApp());
}

class flutterApp extends StatefulWidget {
  const flutterApp({super.key});

  @override
  State<flutterApp> createState() => _flutterAppState();
}

class _flutterAppState extends State<flutterApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
