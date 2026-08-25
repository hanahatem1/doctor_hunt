import 'package:doctor_hunt/apps/features/find_doctor.dart/presentation/widgets/doctor_search_result_card.dart';
import 'package:doctor_hunt/generated/images_assets.dart';
import 'package:flutter/material.dart';

class DoctorsSearchResultsList extends StatelessWidget {
  const DoctorsSearchResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> dummyDoctors = [
      {
        'imagePath': AppImages.pngDoctor,
        'name': 'Dr. Shruti Kedia',
        'specialty': 'Tooths Dentist',
        'yearsOfExperience': 7,
        'matchPercentage': 87,
        'patientStoriesCount': 69,
        'nextAvailableTime': '10:00 AM tomorrow',
        'isFavorite': true,
      },
      {
        'imagePath': AppImages.pngDoctor,
        'name': 'Dr. Watney',
        'specialty': 'Eye Specialist',
        'yearsOfExperience': 9,
        'matchPercentage': 95,
        'patientStoriesCount': 112,
        'nextAvailableTime': '12:00 PM tomorrow',
        'isFavorite': false,
      },
      {
        'imagePath': AppImages.pngDoctor,
        'name': 'Dr. Crown',
        'specialty': 'Skin & Hair Care',
        'yearsOfExperience': 5,
        'matchPercentage': 79,
        'patientStoriesCount': 43,
        'nextAvailableTime': '02:30 PM today',
        'isFavorite': true,
      },
      {
        'imagePath': AppImages.pngDoctor,
        'name': 'Dr. Lachinet',
        'specialty': 'Pediatrician',
        'yearsOfExperience': 12,
        'matchPercentage': 91,
        'patientStoriesCount': 88,
        'nextAvailableTime': '04:00 PM tomorrow',
        'isFavorite': false,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: dummyDoctors.length,
      itemBuilder: (context, index) {
        final doctor = dummyDoctors[index];
        return DoctorSearchResultCard(
          imagePath: doctor['imagePath'],
          name: doctor['name'],
          specialty: doctor['specialty'],
          yearsOfExperience: doctor['yearsOfExperience'],
          matchPercentage: doctor['matchPercentage'],
          patientStoriesCount: doctor['patientStoriesCount'],
          nextAvailableTime: doctor['nextAvailableTime'],
          isFavorite: doctor['isFavorite'],
          onTap: () {},
          onFavoriteTap: () {},
          onBookTap: () {},
        );
      },
    );
  }
}