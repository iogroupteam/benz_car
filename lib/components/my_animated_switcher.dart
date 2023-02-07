import 'package:flutter/cupertino.dart';

class MyAnimatedSwitcher extends StatelessWidget {
  final bool is_anim;
  final Widget child_one;
  final Widget child_two;
  final Curve curve;
  final int duration;
  const MyAnimatedSwitcher({
    super.key,
    required this.is_anim,
    required this.child_one,
    required this.child_two,
    this.curve = Curves.easeInOutBack,
    this.duration = 600,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: duration),
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: animation,
        child: child,
      ),
      switchInCurve: curve,
      child: is_anim ? child_one : child_two,
    );
  }
}
