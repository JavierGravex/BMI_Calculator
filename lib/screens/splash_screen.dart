import 'package:flutter/material.dart';
import 'select_metric_screen.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, navigateToScreen);
  }

  navigateToScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute( builder: (context) => SelectMetricScreen() ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF3C6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "BMI\n",
                      style: TextStyle(
                        fontSize: 64,
                        fontFamily: 'AlbertSans-SemiBold',
                        color: Color(0xFF603F2E),
                      ),
                    ),
                    TextSpan(
                      text: "Calculator",
                      style: TextStyle(
                        fontSize: 36,
                        fontFamily: 'AlbertSans-SemiBold',
                        color: Color(0xFF603F2E),
                      ),
                    ),
                  ],
                ),
              )

            
          ],
        ),
      ),
    );
  }
}