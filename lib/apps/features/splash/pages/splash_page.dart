import 'package:doctor_hunt/generated/images_assets.dart';
import 'package:flutter/material.dart';
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              AppImages.splash1,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              AppImages.splash2,
            ),
          ),
             Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppImages.logo,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Doctor Hunt',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}