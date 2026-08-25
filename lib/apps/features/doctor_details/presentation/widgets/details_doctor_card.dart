import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_sized_box.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class DetailsDoctorCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String specialty;
  final double rating;
  final double hourlyRate;
  final VoidCallback? onBookPressed;
  final VoidCallback? onFavoritePressed;
  final bool isFavorite;

  const DetailsDoctorCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.hourlyRate,
    this.onBookPressed,
    this.onFavoritePressed,
    this.isFavorite = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  imageUrl,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 70,
                    height: 70,
                    color: AppColors.gray,
                    child: const Icon(Icons.person, color: AppColors.gray),
                  ),
                ),
              ),
              12.h,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: context.bold16Black,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        GestureDetector(
                          onTap: onFavoritePressed,
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? AppColors.danger: AppColors.gray,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      specialty,
                      style: context.regular13Gray
                    ),
                    8.h,
                     Row(
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              size: 14,
                              color: index < rating.floor()
                                  ? AppColors.warning
                                  : AppColors.gray,
                            );
                          }),
                        ),
                        const Spacer(),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '\$${hourlyRate.toStringAsFixed(2)}',
                                style: context.bold13Primary
                              ),
                               TextSpan(
                                text: '/hr',
                                style:context.regular13Gray
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
            SizedBox(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: onBookPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00C88C),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Book Now',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}