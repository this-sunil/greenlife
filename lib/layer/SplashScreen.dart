import 'package:flutter/material.dart';
import 'package:greenlife/core/router/AppRoute.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animation = Tween<double>(
      begin: 1.5,
      end: 2.5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));
    _controller.forward();
    super.initState();
    _controller.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.completed:
          context.pushAndRemoveUntil(AppRoute.dashboard);
        default:
          break;
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) {
          return ScaleTransition(
            scale: _animation,
            child: Center(child: FlutterLogo()),
          );
        },
      ),
    );
  }
}
