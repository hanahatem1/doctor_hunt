import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_sized_box.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class DoctorLiveCard extends StatelessWidget {
  final String image;
  final VoidCallback onTap;

  const DoctorLiveCard({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 160,
      margin: const EdgeInsets.only(right: 12),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.danger,
                borderRadius: BorderRadius.circular(6),
              ),
              child:  Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.circle, color: AppColors.white, size: 6),
                  4.h,
                  Text(
                    'LIVE',
                    style: context.regular11White
                  ),
                ],
              ),
            ),
          ),

          Center(
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.black.withOpacity(0.3),
                  border: Border.all(color: AppColors.white, width: 2),
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  color: AppColors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
