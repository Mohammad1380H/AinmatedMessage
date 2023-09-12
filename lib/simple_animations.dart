import 'package:flutter/material.dart';

class Animations extends StatefulWidget {
  const Animations({super.key});

  @override
  State<Animations> createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations> {
  double opacity = 0.1;
  double width = 50;
  double height = 50;
  Color color = Colors.green;
  double borderRadius = 10;
  double top = 10;
  double right = 10;
  double turns = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
          onPressed: () {
            setState(() {
              if (opacity == 1) {
                opacity = 0.5;
                width = 100;
                height = 100;
                color = Colors.green;
                borderRadius = width / 4;
              } else {
                opacity = 1;
                width = 60;
                height = 60;
                color = Colors.blueAccent;
                borderRadius = width / 2;
              }
              top += 20;
              turns++;
              right += 20;
            });
          },
          child: const Text('run')),
      body: Stack(children: [
        AnimatedPositioned(
          curve: Curves.elasticInOut,
          duration: const Duration(seconds: 1),
          top: top,
          right: right,
          child: AnimatedOpacity(
            curve: Curves.easeInOut,
            duration: const Duration(seconds: 1),
            opacity: opacity,
            child: AnimatedRotation(
              duration: const Duration(seconds: 1),
              turns: turns,
              child: AnimatedContainer(
                curve: Curves.easeInOutBack,
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(borderRadius)),
                width: width,
                height: height,
                duration: const Duration(seconds: 1),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
