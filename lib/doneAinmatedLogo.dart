import 'dart:math';

import 'package:flutter/material.dart';

class DoneAnimatedLogo extends StatefulWidget {
  const DoneAnimatedLogo({super.key,required this.message,required this.isDone, this.size = 60, this.milliseconds = 900});
  final String? message;
  final int? milliseconds;
  final int? size;
  final bool? isDone;
  @override
  State<DoneAnimatedLogo> createState() => _DoneAnimatedLogoState();
}

class _DoneAnimatedLogoState extends State<DoneAnimatedLogo>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late final Animation<double> rotationAnimation =
      Tween<double>(begin: 0, end: 2 * pi).animate(_animationController);
  late final Animation<Color?> colorAnimation =
      ColorTween(begin: Colors.blue, end: widget.isDone!?Colors.green:Colors.red)
          .animate(_animationController);
  bool isLiked = false;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration:  Duration(milliseconds: widget.milliseconds!));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: CurvedAnimation(
              parent: _animationController, curve: Curves.bounceInOut),
          builder: (BuildContext context, Widget? child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.rotate(
                  angle: rotationAnimation.value,
                  child: Container(
                    width: _animationController.value * widget.size!,
                    height: _animationController.value * widget.size!,
                    decoration: BoxDecoration(
                        color: colorAnimation.value,
                        borderRadius: BorderRadius.circular(widget.size!/2)),
                    child: Icon(
                      widget.isDone!? Icons.done:Icons.close,
                      size: _animationController.value * widget.size!/2,
                      color: Colors.white,
                    ),
                  ),
                ),
                Opacity(
                    opacity: _animationController.value,
                    child: Text(
                      widget.message!,
                      style: TextStyle(
                        fontSize:widget.size!/3.5,
                      ),
                    ))
              ],
            );
          },
        ),
      ),
    );
  }
}
