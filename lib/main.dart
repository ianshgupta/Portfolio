import 'package:flutter/material.dart';
import 'package:portfolio/pages/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ansh Gupta',
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}
