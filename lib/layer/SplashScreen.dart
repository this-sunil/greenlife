import 'package:flutter/material.dart';
import 'package:greenlife/core/router/AppRoute.dart';
import 'package:solar_icons/solar_icons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> scaleAnimation;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    scaleAnimation = Tween<double>(
      begin: 0.6,
      end: 1.2,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(seconds: 200));
        context.pushAndRemoveUntil(AppRoute.signIn);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              /// 🌊 BACKGROUND SPREAD ANIMATION
              Positioned.fill(
                child: CustomPaint(
                  painter: SplashSpreadPainter(_controller.value),
                ),
              ),

              /// 🔥 CONTENT
              Center(
                child: FadeTransition(
                  opacity: fadeAnimation,
                  child: ScaleTransition(
                    scale: scaleAnimation,
                    child: const SplashContent(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SplashSpreadPainter extends CustomPainter {
  final double progress;

  SplashSpreadPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.green.shade100;

    final center = Offset(size.width / 2, size.height / 2);

    /// 🔥 MAX RADIUS (covers full screen diagonally)
    final maxRadius = size.longestSide * 1.2;

    final radius = maxRadius * progress;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant SplashSpreadPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

/// 🧠 STATIC CONTENT
class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.3),
                blurRadius: 25,
                spreadRadius: 5,
              ),
            ],
          ),
          child: const  Icon(
            SolarIconsOutline.shieldPlus,

            size: 70,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 20),

        const Text(
          "Health Care",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          "Your Health, Our Priority",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}