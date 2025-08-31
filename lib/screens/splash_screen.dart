import 'package:expense_tracker/themes/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: blueGradient),
        child: Stack(
          children: [
            //icon
            Center(
              child: Image.asset(
                'assets/icons/expense_tracker_icon1.png',
                width: 180,
                height: 180,
                fit: BoxFit.contain,
              ),
            ),
            //loader at the bottom
            Positioned(
              left: 0,
              right: 0,
              bottom: 40,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(appPrimaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
