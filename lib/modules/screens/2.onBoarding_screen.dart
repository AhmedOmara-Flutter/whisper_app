import 'package:flutter/material.dart';
import 'package:lost_project/modules/login/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../models/onboarding_model.dart';
import '../../shared/function/function.dart';

// ignore: must_be_immutable
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var controller = PageController();
  List<OnBoardingModel> onBoardingModel = [
    OnBoardingModel(
      image: 'images/onboarding2.jpg',
      text1: 'Welcome to Lost App!',
      text2:
          'Discover new features and unlock your potential with our easy-to-use tools. Let’s get started!',
    ),
    OnBoardingModel(
        image: 'images/onboarding3.jpg',
        text1: 'Explore Our Key Features',
        text2:
            'From hourly forecasts to severe weather alerts, our app provides comprehensive weather information at your fingertips '),
    OnBoardingModel(
        image: 'images/onboarding1.jpg',
        text1: 'Ready to Dive In?',
        text2:
            'Join our community and start your journey today. Sign up now and make the most of Lost App!'),
  ];
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 5.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: MaterialButton(
                    color: Colors.blue,
                    onPressed: () {
                      navigateTo(context, const ChatLoginScreen(), true);
                    },
                    child: const Text(
                      'SKIP',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage(
                      onBoardingModel[index].image,
                    ),
                    fit: BoxFit.fill,
                    height: 390.0,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          onBoardingModel[index].text1,
                          style: const TextStyle(
                              fontSize: 35.0,
                              height: 1.2,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          onBoardingModel[index].text2,
                          style: const TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1a2326),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              onPageChanged: (index) {
                if (index == onBoardingModel.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              itemCount: onBoardingModel.length,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: controller, // PageController
                    count: onBoardingModel.length,
                    effect: const ExpandingDotsEffect(
                        activeDotColor: Colors.blue,
                        dotWidth: 40.0,
                        spacing: 10,
                        dotHeight: 6.0),
                  ),
                  isLast == true
                      ? Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                onPressed: () {
                                  navigateTo(
                                      context, const ChatLoginScreen(), true);
                                },
                                child: isLast
                                    ? const Text(
                                        'get started',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                      )
                                    : const Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        color: Colors.white,
                                      ),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomButton(
                              onPressed: () {
                                controller.previousPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.bounceInOut);
                              },
                              child: const Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: Colors.white,
                              ),
                            ),
                            CustomButton(
                              onPressed: () {
                                controller.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.bounceInOut);
                              },
                              child: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class CustomButton extends StatelessWidget {
  final Widget? child;
  final void Function()? onPressed;

  CustomButton({super.key, this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: SizedBox(
        child: MaterialButton(
            color: Colors.blue,
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
            onPressed: onPressed,
            child: child),
      ),
    );
  }
}
