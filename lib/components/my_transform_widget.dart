import 'package:flutter/material.dart';

class MyTransformWidget extends StatefulWidget {
  final Widget child;
  final double offset;
  final int duration;
  final Curve curve;
  final Axis axis;
  const MyTransformWidget({
    super.key,
    required this.child,
    this.offset = 140.0,
    this.duration = 600,
    this.curve = Curves.elasticOut,
    this.axis = Axis.horizontal,
  });

  @override
  State<MyTransformWidget> createState() => _MyTransformWidgetState();
}

class _MyTransformWidgetState extends State<MyTransformWidget> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: widget.duration),
      tween: Tween(begin: 1.0, end: 0.0),
      curve: widget.curve,
      builder: (context, value, child) {
        return Transform.translate(
          offset: widget.axis == Axis.horizontal
              ? Offset(value * widget.offset, 0.0)
              : Offset(0.0, value * widget.offset),
          child: widget.child,
        );
      },
    );
  }
}
