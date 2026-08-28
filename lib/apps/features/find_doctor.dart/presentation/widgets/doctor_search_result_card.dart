import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_sized_box.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

// CR: hardcode texts

class DoctorSearchResultCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String specialty;
  final int yearsOfExperience;
  final int matchPercentage;
  final int patientStoriesCount;
  final String nextAvailableTime;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onBookTap;

  const DoctorSearchResultCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.specialty,
    required this.yearsOfExperience,
    required this.matchPercentage,
    required this.patientStoriesCount,
    required this.nextAvailableTime,
    this.isFavorite = true,
    this.onTap,
    this.onFavoriteTap,
    this.onBookTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: AppColors.boxShadow,
              blurRadius: 15,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imagePath,
                    width: 82,
                    height: 82,
                    fit: BoxFit.cover,
                  ),
                ),
                12.w,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              style: context.bold16TextMain,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          GestureDetector(
                            onTap: onFavoriteTap,
                            child: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite
                                  ? AppColors.danger
                                  : AppColors.textPlaceholder,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      2.h,
                      Text(specialty, style: context.medium13Primary),
                      4.h,
                      Text(
                        '$yearsOfExperience Years experience',
                        style: context.regular12TextSub,
                      ),
                      8.h,
                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          6.w,
                          Text(
                            '$matchPercentage%',
                            style: context.regular11TextSub,
                          ),
                          16.w,
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          6.w,
                          Text(
                            '$patientStoriesCount Patient Stories',
                            style: context.regular11TextSub,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            14.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Next Available', style: context.semiBold13Primary),
                    4.h,
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: nextAvailableTime.split(' ').first,
                            style: context.bold12TextSub,
                          ),
                          TextSpan(
                            text:
                                ' ${nextAvailableTime.split(' ').skip(1).join(' ')}',
                            style: context.regular11TextSub,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 36,
                  // CR: use CustomButton
                  child: ElevatedButton(
                    onPressed: onBookTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    child: Text('Book Now', style: context.bold13White),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
