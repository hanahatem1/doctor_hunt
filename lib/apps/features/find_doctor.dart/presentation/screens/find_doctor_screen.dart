import 'package:doctor_hunt/apps/core/widgets/auth_background.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_appbar.dart';
import 'package:doctor_hunt/apps/features/find_doctor.dart/presentation/widgets/custom_search_bar.dart';
import 'package:doctor_hunt/apps/features/find_doctor.dart/presentation/widgets/doctor_search_result_list.dart';
import 'package:flutter/material.dart';

class FindDoctorScreen extends StatelessWidget {
  const FindDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(title: 'Find Doctor'),
        body: Column(
          children: [
            CustomSearchBar(),
            Expanded(child: DoctorsSearchResultsList())
          ],
        ),
      ),
    );
  }
}