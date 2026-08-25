import 'package:doctor_hunt/apps/core/widgets/auth_background.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_appbar.dart';
import 'package:doctor_hunt/apps/features/appointment/presentation/widgets/calender_card.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(title:'Appointment'),
        body: Column(
          children: [
            CalenderCard()
          ],
        ),
      ),
    );
  }
}