import 'package:benz_car/components/fade_animation.dart';
import 'package:benz_car/components/my_animated_switcher.dart';
import 'package:benz_car/components/my_transform_widget.dart';
import 'package:flutter/material.dart';

class CarHome extends StatefulWidget {
  const CarHome({super.key});

  @override
  State<CarHome> createState() => _CarHomeState();
}

class _CarHomeState extends State<CarHome> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Opacity(
              opacity: 0.04,
              child: Center(child: Image.asset("assets/logo.png")),
            ),
            AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                top: 10.0,
                left: is_car ? 140.0 : 10.0,
                child: title()),
            logo(),
            background(),
            Positioned(
                top: 50.0,
                right: 50.0,
                child: is_light ? light() : const SizedBox()),
            Positioned(
                top: 50.0,
                right: 160.0,
                child: is_light ? light() : const SizedBox()),
            car_image(),
            car_utility(),
            is_image_set(),
            info_detail(),
          ],
        ),
      ),
    );
  }

  bool is_logo = true;
  Widget logo() {
    return Positioned(
      right: 10.0,
      top: 10.0,
      child: FadeAnimation(
        delay: 1000,
        is_horizental: true,
        child: MyAnimatedSwitcher(
          child_one: Image.asset("assets/logo.png", height: 40.0),
          child_two: const SizedBox(),
          is_anim: is_logo,
        ),
      ),
    );
  }

  Widget title() {
    return const FadeAnimation(
      delay: 800,
      is_horizental: true,
      child: Text(
        "Mersedes Benz",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
    );
  }

  bool is_car = false;
  Widget car_image() {
    return AnimatedPositioned(
        duration: const Duration(milliseconds: 500),
        bottom: is_car ? 270 : 40.0,
        right: is_info ? -100 : 22.0,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 600),
          opacity: is_info ? 0.2 : 1.0,
          child: FadeAnimation(
              delay: 2000,
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      is_car = !is_car;
                      if (is_car) {
                        is_info = false;
                        is_light = false;
                        is_logo = false;
                      } else {
                        is_logo = true;
                      }
                    });
                  },
                  child: Image.asset("assets/car.png", height: 400))),
        ));
  }

  Widget is_image_set() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        car_image_title("Performance : 8.5/10", 1000, Colors.green),
        car_image_title("Comfort : 9.0/10", 1200, Colors.green),
        car_image_title("Interior : 7/10", 1400, Colors.green),
        car_image_title("Technology : 9.0/10", 1600, Colors.green),
        car_image_title("Storage : 6.5/10", 1800, Colors.amber),
        car_image_title("Fuel Economy : 7.0/10 : 6.5/10", 1800, Colors.green),
        car_image_title("Value : 7.5/10 : 6.5/10", 1800, Colors.green),
        car_image_title("Wildcard : 8.5/10 : 6.5/10", 1800, Colors.green),
      ],
    );
  }

  Widget car_image_title(title, int duration, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (child, animation) =>
            AnimatedSwitcher.defaultTransitionBuilder(child, animation),
        child: is_car
            ? MyTransformWidget(
                duration: duration,
                child: Row(
                  children: [
                    Icon(Icons.arrow_drop_up_rounded, color: color),
                    Text(title),
                  ],
                ))
            : const SizedBox(),
      ),
    );
  }

  Widget info_detail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (child, animation) =>
            AnimatedSwitcher.defaultTransitionBuilder(child, animation),
        child: is_info
            ? const Center(
                child: FadeAnimation(
                delay: 1000,
                child: Text(
                  "After taking a leave of absence last year, the iconic Mercedes-Benz SL is back and completely redesigned for 2022. This luxury convertible isn't quite as soft and luxurious as past SL generations, but as Mercedes attempts to attract a younger audience, perhaps that's not a bad thing. Besides being the new SL, this model also fills the void created by the discontinuation of Mercedes' AMG GT and larger S-Class convertibles.\n The new 2022 Mercedes-Benz AMG SL is offered in two flavors. The AMG SL 55 has an abundance of power from its turbocharged V8 engine, and the AMG SL 63 further emphasizes performance with more power and a few sporty enhancements. Mercedes has replaced the previous retractable hardtop roof design with a more traditional fabric top. This might seem like a step backward, but the new soft top does an excellent job of keeping the cabin calm and quiet when it's deployed. And when stowed, it takes up less space than the old hardtop.\n The 2022 AMG SL is more of a sporty grand-touring convertible than its performance-focused rivals. The Porsche 911 Carrera 4S and BMW 8 Series convertibles are more engaging and capable on a fun road, but that athleticism comes at the expense of comfort, refinement and practicality. The Audi R8 Spyder takes performance and the ensuing reduction in refinement even further. That leaves the SL in its historically appropriate setting as a more elegant roadster, though this time around it has more muscle. Check out our Expert Rating below for our test team's full scoring and analysis of this year's new SL.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))
            : const SizedBox(),
      ),
    );
  }

  Widget car_utility() {
    return AnimatedPositioned(
      duration: Duration(milliseconds: is_car ? 300 : 500),
      bottom: is_info ? 10.0 : 90.0,
      left: is_car ? -200.0 : 20.0,
      child: Column(
        children: [
          car_utility_button(
              "Light",
              MyAnimatedSwitcher(
                child_one: Image.asset(
                  "assets/car-light.png",
                  height: 22.0,
                  color: Colors.blue,
                  key: const ValueKey("true"),
                ),
                child_two: Image.asset(
                  "assets/car-light.png",
                  height: 22.0,
                  key: const ValueKey("false"),
                ),
                is_anim: is_light,
                duration: 500,
              ),
              1200, () {
            setState(() {
              is_light = !is_light;
              if (is_light) {
                is_info = false;
                is_car = false;
                is_logo = false;
              } else {
                is_logo = true;
              }
            });
          }),
          car_utility_button(
              "Info",
              MyAnimatedSwitcher(
                child_one: Image.asset(
                  "assets/info.png",
                  height: 22.0,
                  color: Colors.blue,
                  key: const ValueKey("true"),
                ),
                child_two: Image.asset(
                  "assets/info.png",
                  height: 22.0,
                  key: const ValueKey("false"),
                ),
                is_anim: is_info,
                duration: 500,
              ),
              1400, () {
            setState(() {
              is_info = !is_info;
              if (is_info) {
                is_light = false;
                is_car = false;
              }
            });
          })
        ],
      ),
    );
  }

  Widget light() {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return FadeAnimation(
      delay: 200,
      child: Container(
        height: myHeight * 0.3,
        width: myWidth * 0.1,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0),
              topLeft: Radius.circular(35.0),
              topRight: Radius.circular(35.0),
            ),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.amber.withOpacity(0.5),
                  Colors.amber.withOpacity(0.01),
                ])),
      ),
    );
  }

  bool is_info = false;
  bool is_light = false;
  Widget car_utility_button(
      String title, Widget image, int delay, VoidCallback ontab) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return FadeAnimation(
      delay: delay,
      is_horizental: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: GestureDetector(
          onTap: ontab,
          child: Container(
            height: myHeight * 0.07,
            width: myWidth * 0.3,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Text(title), image],
            ),
          ),
        ),
      ),
    );
  }

  Widget background() {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: myHeight,
          width: myWidth * 0.7,
        ),
        Expanded(
          child: Container(
            height: myHeight,
            color: Colors.grey.withOpacity(0.1),
          ),
        )
      ],
    );
  }
}
