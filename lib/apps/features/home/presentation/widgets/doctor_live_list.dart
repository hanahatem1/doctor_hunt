import 'package:doctor_hunt/apps/features/home/presentation/widgets/doctor_live_card.dart';
import 'package:doctor_hunt/generated/images_assets.dart';
import 'package:flutter/material.dart';

class DoctorLiveList extends StatelessWidget {
  final List<String> doctorsList = const [
    AppImages.pngDoctor,
   AppImages.pngDoctor,
 AppImages.pngDoctor,
   ];

  const DoctorLiveList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: doctorsList.length,
            itemBuilder: (context, index) {
              return DoctorLiveCard(
                image: doctorsList[index],
                onTap: () {
                },
              );
            },
          ),
        ),
      ],
    );
  }
}