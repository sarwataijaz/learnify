import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learnify/sign_in.dart';

import 'colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // want to manage a single animation

  late AnimationController controller;
  late Animation<double> sizeAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    // No access to MediaQuery here
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Access MediaQuery after the widget is inserted into the widget tree
    sizeAnimation = Tween<double>(
      begin: 0.0,
      end: MediaQuery.of(context).size.width, // Now it's safe to use MediaQuery
    ).animate(controller);

    controller.forward();

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Timer(Duration(seconds: 2),
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SignIn()),
            ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: AnimatedBuilder(
          animation: sizeAnimation,
          builder: (context, child) {
            return Container(
              width: sizeAnimation.value,
              height: sizeAnimation.value,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: child,
            );
          },
          child: Image.asset(
            'assets/app_logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
