import 'package:flutter/material.dart';
import 'package:indiarasoi/Helpers/onboarding.dart';
import 'package:indiarasoi/Helpers/onboardingdata.dart';
import 'package:indiarasoi/Screens/Homepage.dart';

class TestScreen extends StatelessWidget {
  final List<OnbordingData> list = [
    OnbordingData(
      imagePath: "assets/onboarding1.jpg",
      title: "Indian Rasoi",
      desc:
      "Welcome to Indian Rasoi,app for food lovers,satisfy your taste",
    ),
    OnbordingData(
      imagePath: "assets/onboarding2.png",
      title: "Recipies",
      desc:
      "Here the Recipies are made with love for you and your sweet one's",
    ),
    OnbordingData(
      imagePath: "assets/onboarding3.jpg",
      title: "Love",
      desc:
      "Make Food for your loved one's with taking care of calories",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return  IntroScreen(
      list, MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
}