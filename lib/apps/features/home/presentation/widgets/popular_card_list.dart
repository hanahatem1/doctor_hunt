import 'package:doctor_hunt/apps/features/home/presentation/widgets/popular_doctor_card.dart';
import 'package:doctor_hunt/generated/images_assets.dart';
import 'package:flutter/material.dart';

class PopularDoctorsList extends StatelessWidget {
  const PopularDoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> popularDoctorsList = [
      {
        'image': AppImages.pngDoctor,
        'name': 'Dr. Fillerup Grab',
        'specialty': 'Medicine Specialist',
        'rating': 4.0,
      },
      {
        'image': AppImages.pngDoctor,
        'name': 'Dr. Blessing',
        'specialty': 'Dentist Specialist',
        'rating': 4.0,
      },
       {
        'image': AppImages.pngDoctor,
        'name': 'Dr. Blessing',
        'specialty': 'Dentist Specialist',
        'rating': 4.0,
      },
    ];

    return SizedBox(
      height: 195,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: popularDoctorsList.length,
        itemBuilder: (context, index) {
          final doctor = popularDoctorsList[index];
          return PopularDoctorCard(
            image: doctor['image'],
            name: doctor['name'],
            specialty: doctor['specialty'],
            rating: doctor['rating'],
            onTap: () {},
          );
        },
      ),
    );
  }
}