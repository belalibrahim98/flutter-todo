import 'package:flutter/material.dart';
import 'package:todo_app/ui/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });
    return Image.asset(
      'assets/images/splash_background.png',
      fit: BoxFit.fill,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
