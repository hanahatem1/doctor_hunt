import 'package:doctor_hunt/apps/core/widgets/auth_background.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_sized_box.dart';
import 'package:doctor_hunt/apps/features/home/presentation/widgets/doctor_live_list.dart';
import 'package:doctor_hunt/apps/features/home/presentation/widgets/feature_doctor_list.dart';
import 'package:doctor_hunt/apps/features/home/presentation/widgets/home_appbar.dart';
import 'package:doctor_hunt/apps/features/home/presentation/widgets/popular_card_list.dart';
import 'package:doctor_hunt/apps/features/home/presentation/widgets/special_category_list.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
// CR: Hardcode Texts
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar:HomeAppbar(), 
        body: ListView(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          children: [
            Text(
  'Live Doctors',
  style: context.bold18.gray,
),
            DoctorLiveList(),
            SpecialCategoryList(),
            10.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('popular doctor',style:context.bold14),
                
                Text('see all',style: context.regular13Gray)
              ],
            ),
            5.h,
            PopularDoctorsList(),
            10.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('feature doctor',style: context.bold14),
                Text('see all',style: context.regular13Gray)
              ],
            ),
            5.h,
            FeatureDoctorsList()
          ],
        ),
      ),
    );
  }
}