import 'package:doctor_hunt/apps/features/favourites/presentation/widgets/fav_doctor_card.dart';
import 'package:doctor_hunt/generated/images_assets.dart';
import 'package:flutter/material.dart';

class FavDoctorGridView extends StatelessWidget {
  FavDoctorGridView({super.key});

  final List<Map<String, dynamic>> doctorsData = [
    {
      'name': 'Dr. Ahmed Ali',
      'specialty': 'Cardiologist',
      'imageUrl': AppImages.pngDoctor,
      'isFavorite': true,
    },
    {
      'name': 'Dr. Sara Mohamed',
      'specialty': 'Dentist',
      'imageUrl': AppImages.pngDoctor,
      'isFavorite': true,
    },
    {
      'name': 'Dr. Omar Hassan',
      'specialty': 'Dermatologist',
      'imageUrl': AppImages.pngDoctor,
      'isFavorite': true,
    },
    {
      'name': 'Dr. Mona Ahmed',
      'specialty': 'Neurologist',
      'imageUrl': AppImages.pngDoctor,
      'isFavorite': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.85,
      ),
      itemCount: doctorsData.length,
      itemBuilder: (context, index) {
        final doctor = doctorsData[index];

        return FavDoctorCard(
          name: doctor['name'],
          specialty: doctor['specialty'],
          imageUrl: doctor['imageUrl'],
          isFavorite: doctor['isFavorite'] ?? false,
          onFavoriteTap: () {},
          onTap: () {},
        );
      },
    );
  }
}