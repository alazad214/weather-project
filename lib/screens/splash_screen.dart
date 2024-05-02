import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_project/screens/home_screen.dart';
import 'package:weather_project/utils/colors.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Get.offAll(() =>  HomeScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Center(
            child: Lottie.asset("assets/animations/weather.json",
                height: Height / 8)),
      ),
    );
  }
}
