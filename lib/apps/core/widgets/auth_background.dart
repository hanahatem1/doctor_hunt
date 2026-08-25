import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/images_assets.dart';
import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.white,
        ),

        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            AppImages.pngSplash1,
          ),
        ),

        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            AppImages.pngSplash2,
          ),
        ),

        child,
      ],
    );
  }
}