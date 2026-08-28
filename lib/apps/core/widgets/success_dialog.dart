import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_sized_box.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration:  BoxDecoration(
            color: AppColors.primaryLight,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.thumb_up_rounded,
            color: AppColors.primary,
            size: 60,
          ),
        ),
        // CR: Localize hardcoded dialog strings using slang tr.*
        24.h,
         Text(
          'Thank You !',
          style:context.bold24Black
        ),
        8.h,
         Text(
          'Your Appointment Successful',
          style: context.semiBold16Gray,
          textAlign: TextAlign.center,
        ),
        16.h,
         Text(
          'You booked an appointment with Dr. Pediatrician Purpieson on February 21, at 02:00 PM',
          style:context.regular13Gray,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24.0),
        SizedBox(
          width: double.infinity,
          height: 48,
          // CR: use CustomButton
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:AppColors.primary,
              foregroundColor: AppColors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child:  Text(
              'Done',
              style:context.bold16,
            ),
          ),
        ),
        16.h,
        GestureDetector(
          onTap: () {
          },
          child:  Text(
            'Edit your appointment',
            style:context.semiBold13Gray
          ),
        ),
      ],
    ),
  ),
);
  }
}