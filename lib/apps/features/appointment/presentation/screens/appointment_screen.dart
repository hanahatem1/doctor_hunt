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
        // CR: Hardcode text
        appBar: CustomAppBar(title:'Appointment'),
        body: Column(
          children: [
            // CR: طلاما الكود هيبقي جواه widget واحد ف مش مستاهله يحصل extract widget خليه كلو في نفس الفايل
            CalenderCard()
          ],
        ),
      ),
    );
  }
}