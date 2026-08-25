import 'package:doctor_hunt/apps/core/widgets/auth_background.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_appbar.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_sized_box.dart';
import 'package:doctor_hunt/apps/features/select_time/presentation/widgets/card_of_doctor.dart';
import 'package:doctor_hunt/apps/features/select_time/presentation/widgets/date_select.dart';
import 'package:doctor_hunt/apps/features/select_time/presentation/widgets/time_slot_picker.dart';
import 'package:flutter/material.dart';

class SelectTimeScreen extends StatelessWidget {
  const SelectTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(title: 'Select Time'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
          child: Column(
            children: [
              CardOfDoctor(),
              8.h,
              DateSelect(),
              8.h,
              TimeSlotPicker()
            ],
          ),
        ),
      ),
    );
  }
}