import 'package:animations/doneAinmatedLogo.dart';
import 'package:animations/home.dart';
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
      title: 'Animations',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DoneAnimatedLogo(
        isDone: true,
        message: 'اطلاعات صحیح است',
        milliseconds: 250,
        

      ),
    );
  }
}
