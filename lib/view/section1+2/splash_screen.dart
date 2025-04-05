import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'on_boarding_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
          children: [
          SvgPicture.asset('assets/Pattern.svg'),
          Center(
          child: Image.asset('assets/logo.png'),

      ),
   ]
    ),
    );
  }
}