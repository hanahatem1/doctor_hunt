import 'package:doctor_hunt/apps/core/widgets/auth_background.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_appbar.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_sized_box.dart';
import 'package:doctor_hunt/apps/features/favourites/presentation/widgets/fav_doctor_grid_view.dart';
import 'package:doctor_hunt/apps/features/find_doctor.dart/presentation/widgets/custom_search_bar.dart';
import 'package:doctor_hunt/apps/features/home/presentation/widgets/feature_doctor_list.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

// CR: Typo in filename & class name favourite_sceeen.dart -> favourite_screen.dart
// CR: Hardcode Texts

class FavouriteSceeen extends StatelessWidget {
  const FavouriteSceeen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(title: 'Favourite Dotor'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 20,
            ),
            child: Column(
              children: [
                const CustomSearchBar(),
                8.h,
                 FavDoctorGridView(),
                8.h,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Feature Doctor',
                      style: context.bold18Black,
                    ),
                    Text(
                      'see all',
                      style: context.regular14Primary,
                    ),
                  ],
                ),
                8.h,
                const FeatureDoctorsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}