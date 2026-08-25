import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_sized_box.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class TimeSlotPicker extends StatefulWidget {
  const TimeSlotPicker({super.key});

  @override
  State<TimeSlotPicker> createState() => _TimeSlotPickerState();
}

class _TimeSlotPickerState extends State<TimeSlotPicker> {
  String selectedTime = '2:00 PM';

  final List<String> afternoonSlots = [
    '1:00 PM',
    '1:30 PM',
    '2:00 PM',
    '2:30 PM',
    '3:00 PM',
    '3:30 PM',
    '4:00 PM',
  ];

  final List<String> eveningSlots = [
    '5:00 PM',
    '5:30 PM',
    '6:00 PM',
    '6:30 PM',
    '7:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Afternoon ${afternoonSlots.length} slots',
          style: context.bold16TextMain,
        ),
        12.h,
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: afternoonSlots.map((time) {
            final isSelected = selectedTime == time;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedTime = time;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  time,
                  style: isSelected
                      ? context.semiBold13White
                      : context.semiBold13Primary,
                ),
              ),
            );
          }).toList(),
        ),
        24.h,
        Text(
          'Evening ${eveningSlots.length} slots',
          style: context.bold16TextMain,
        ),
        12.h,
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: eveningSlots.map((time) {
            final isSelected = selectedTime == time;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedTime = time;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  time,
                  style: isSelected
                      ? context.semiBold13White
                      : context.semiBold13Primary,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}