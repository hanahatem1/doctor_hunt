import 'package:doctor_hunt/generated/images_assets.dart';
import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child:Image.asset(
              AppImages.splash1
            )
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              AppImages.splash2
            )
          ),
          SafeArea(child: child),
        ],
      ),
    );
  }
}