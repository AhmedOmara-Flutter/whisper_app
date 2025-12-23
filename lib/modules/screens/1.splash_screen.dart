import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lost_project/modules/screens/2.onBoarding_screen.dart';
import 'package:lost_project/shared/function/function.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

  void delay(context) async {
    await Future.delayed(const Duration(seconds: 6)).then((value) {
      navigateTo(context, const OnBoardingScreen(), true);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
      upperBound: 300.0,
    );
    controller!.forward();
    controller!.animationBehavior;
    controller!.addListener(() {
      setState(() {
        controller!.value;
      });

      print(controller!.value);
    });
    delay(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 120.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'lost',
                      child: Image(
                        image: const AssetImage(
                          'images/lost.png',
                        ),
                        width: controller!.value,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Lost And Found',
                          speed: const Duration(milliseconds: 100),
                          textStyle: const TextStyle(
                              fontSize: 30.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SpinKitCircle(
              color: Colors.blue,
              size: 80.0,
            )
          ],
        ),
      ),
    );
  }
}
