import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/features/home/presentation/widgets/special_category_card.dart';
import 'package:flutter/material.dart';

class SpecialityItem {
  final IconData icon;
  final Color color;

  const SpecialityItem({
    required this.icon,
    required this.color,
  });
}

final List<SpecialityItem> specialCategoriesList = [
  const SpecialityItem(
    icon: Icons.medical_services_rounded,
    color: AppColors.blue,
  ),
  const SpecialityItem(
    icon: Icons.favorite_rounded,
    color: AppColors.primary,
  ),
  const SpecialityItem(
    icon: Icons.visibility_rounded,
    color: AppColors.warning,
  ),
  const SpecialityItem(
    icon: Icons.accessibility_new_rounded,
    color: AppColors.danger,
  ),
];
class SpecialCategoryList extends StatelessWidget {
  const SpecialCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,   
        itemCount: specialCategoriesList.length,
        itemBuilder: (context, index) {
          final item = specialCategoriesList[index];
          return SpecialCategoryCard(
            icon: item.icon,
            color: item.color,
            onTap: () {
            }, 
          );
        },
      ),
    );
  }
}