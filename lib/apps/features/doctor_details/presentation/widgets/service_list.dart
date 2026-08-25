import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_sized_box.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class ServiceList extends StatelessWidget {
  const ServiceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Services',
          style: context.bold18Black,
        ),
        12.h,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1.',
              style: context.bold14Primary,
            ),
            8.w,
            Expanded(
              child: Text(
                'Patient care should be the number one priority.',
                style: context.regular14Gray,
              ),
            ),
          ],
        ),
         Divider(
          height: 24,
          thickness: 0.8,
          color: AppColors.grayLightActive,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '2.',
              style: context.bold14Primary,
            ),
            8.w,
            Expanded(
              child: Text(
                'If you run your practiceyou know how frustrating.',
                style: context.regular14Gray,
              ),
            ),
          ],
        ),
         Divider(
          height: 24,
          thickness: 0.8,
          color: AppColors.grayLightActive,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '3.',
              style: context.bold14Primary,
            ),
            8.w,
            Expanded(
              child: Text(
                'That’s why some of appointment reminder system.',
                style: context.regular14Gray,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

