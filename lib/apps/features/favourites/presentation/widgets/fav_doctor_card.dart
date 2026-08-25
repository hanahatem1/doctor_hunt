import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_sized_box.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class FavDoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String imageUrl;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onTap;

  const FavDoctorCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.imageUrl,
    this.isFavorite = false,
    this.onFavoriteTap,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: onFavoriteTap,
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite
                      ? AppColors.danger
                      : AppColors.grayLight,
                  size: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 24, 12, 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 75,
                    height: 75,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE8F1F9),
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.person,
                          size: 40,
                          color: AppColors.grayLight,
                        ),
                      ),
                    ),
                  ),
                  12.h,
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: context.semiBold14Black,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  4.h,
                  Text(
                    specialty,
                    textAlign: TextAlign.center,
                    style: context.medium12Primary,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}