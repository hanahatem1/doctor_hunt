import 'package:doctor_hunt/apps/features/home/presentation/widgets/feature_doctor_card.dart';
import 'package:doctor_hunt/generated/images_assets.dart';
import 'package:flutter/material.dart';

class FeatureDoctorsList extends StatelessWidget {
  const FeatureDoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة بيانات مباشرة باستخدام Map
    final List<Map<String, dynamic>> featureDoctorsList = [
      {
        'image': AppImages.pngPtofile,
        'name': 'Dr. Crick',
        'rating': 3.7,
        'price': 25.00,
        'isFavorite': false,
      },
      {
        'image': AppImages.pngPtofile,
        'name': 'Dr. Strain',
        'rating': 3.0,
        'price': 22.00,
        'isFavorite': true,
      },
      {
        'image':AppImages.pngPtofile,
        'name': 'Dr. Lachinet',
        'rating': 2.9,
        'price': 29.00,
        'isFavorite': false,
      },
    ];

    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: featureDoctorsList.length,
        itemBuilder: (context, index) {
          final doctor = featureDoctorsList[index];
          return FeatureDoctorCard(
            image: doctor['image'],
            name: doctor['name'],
            rating: doctor['rating'],
            price: doctor['price'],
            isFavorite: doctor['isFavorite'],
            onTap: () {},
            onFavoriteTap: () {},
          );
        },
      ),
    );
  }
}