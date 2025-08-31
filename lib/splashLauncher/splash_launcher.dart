import 'package:expense_tracker/screens/home_screen.dart';
import 'package:expense_tracker/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class SplashLauncher extends StatefulWidget {
  const SplashLauncher({super.key});

  @override
  State<SplashLauncher> createState() => _SplashLauncherState();
}

class _SplashLauncherState extends State<SplashLauncher> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
