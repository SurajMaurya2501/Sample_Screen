import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      Navigator.pushNamed(
        context,
        "allScreen",
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        child: Lottie.asset(
          "assets/lottie/owl.json",
          height: 300,
          frameRate: FrameRate(
            120,
          ),
        ),
      ),
    );
  }
}
