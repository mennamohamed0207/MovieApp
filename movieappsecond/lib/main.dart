import 'package:flutter/material.dart';
import 'package:movieappsecond/home/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movie App",
      home: HomePage(),
    );
  }
}

void main() {
  runApp(const MyApp());
}
