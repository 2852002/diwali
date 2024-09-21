import 'package:flutter/material.dart';
import '../main_page/choose_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to ChooseScreen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChooseScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFE34757),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/splash_image.png', // Your splash image
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
