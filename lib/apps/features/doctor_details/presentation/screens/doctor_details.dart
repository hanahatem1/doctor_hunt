import 'package:doctor_hunt/apps/core/widgets/auth_background.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_appbar.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_sized_box.dart';
import 'package:doctor_hunt/apps/features/doctor_details/presentation/widgets/details_doctor_card.dart';
import 'package:doctor_hunt/apps/features/doctor_details/presentation/widgets/doctor_stats_card.dart';
import 'package:doctor_hunt/apps/features/doctor_details/presentation/widgets/service_list.dart';
import 'package:doctor_hunt/generated/images_assets.dart';
import 'package:flutter/material.dart';

class DoctorDetails extends StatelessWidget {
  const DoctorDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(title: 'Doctor Details'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
            child: Column(
              children: [
                DetailsDoctorCard(
              name: 'Dr. Pediatrician',
              specialty: 'Specialist Cardiologist',
              imageUrl: AppImages.pngDoctor,
              rating: 4.0,
              hourlyRate: 28.00,
              onBookPressed: () {
              },
              onFavoritePressed: () {
              },
            ),
            10.h,
            DoctorStatsCard(),
            10.h,
            ServiceList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}