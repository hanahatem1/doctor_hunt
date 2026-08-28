import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_sized_box.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
// CR: Hardcode Texts
class DoctorStatsCard extends StatelessWidget {
  const DoctorStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
  padding: const EdgeInsets.all(12),
  decoration: BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(16),
  ),
  child: Row(
    children: [
      Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color:  AppColors.grayLight1,
            borderRadius: BorderRadius.circular(12),
          ),
          child:  Column(
            children: [
              Text('100', style: context.bold16
              ),
              4.h,
              // CR: Typo 'Runing' -> 'Running' and localize string using tr.*
              Text('Runing', style: context.regular13Gray,)
            ],
          ),
        ),
      ),
      8.w,
      Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.grayLight1,
            borderRadius: BorderRadius.circular(12),
          ),
          child:  Column(
            children: [
              Text('500', style: context.bold16),
              4.h,
              Text('Ongoing', style: context.regular13Gray,),
            ],
          ),
        ),
      ),
     8.w,
      Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.grayLight1,
            borderRadius: BorderRadius.circular(12),
          ),
          child:  Column(
            children: [
              Text('700', style: context.bold16),
              SizedBox(height: 4),
              Text('Patient', style:context.regular13Gray,),
            ],
          ),
        ),
      ),
    ],
  ),
);
  }
}