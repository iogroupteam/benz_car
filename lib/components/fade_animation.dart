import 'dart:async';

import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  final int delay;
  final int duration;
  final Widget child;
  final bool is_horizental;
  const FadeAnimation({
    super.key,
    required this.delay,
    this.duration = 1000,
    required this.child,
    this.is_horizental = false,
  });

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _fadeAnimation;
  late Animation _slidenimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.duration));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      });
    _slidenimation = Tween<double>(begin: 100, end: 0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      });

    Timer(
      Duration(milliseconds: widget.delay),
      () {
        if (mounted) {
          _controller.forward().orCancel;
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _fadeAnimation.value,
      child: Transform.translate(
        offset: widget.is_horizental
            ? Offset(_slidenimation.value, 0)
            : Offset(0, _slidenimation.value),
        child: widget.child,
      ),
    );
  }
}
