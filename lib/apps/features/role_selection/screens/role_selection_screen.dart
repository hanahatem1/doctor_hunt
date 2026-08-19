import 'package:doctor_hunt/apps/core/router/app_router.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_button.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_sized_box.dart';
import 'package:doctor_hunt/apps/core/widgets/auth_background.dart';
import 'package:doctor_hunt/apps/features/role_selection/widgets/role_card_widget.dart';
import 'package:doctor_hunt/generated/images_assets.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';

enum UserRole { patient, admin }

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  UserRole selectedRole = UserRole.patient;

  void _onContinuePressed() {
    if (selectedRole == UserRole.patient) {
      const LoginRoute().go(context);
    } else {
      const LoginRoute().go(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            20.h,
            Column(
              children: [
                Image.asset(AppImages.pngLogo, height: 50),
                8.h,
                Text(tr.doctorHunt, style: context.bold22TextMain),
              ],
            ),
            40.h,
            Column(
              children: [
                Text(tr.chooseYourRole, style: context.bold24TextMain),
                8.h,
                Text(
                  tr.chooseRoleSubTitle,
                  textAlign: TextAlign.center,
                  style: context.regular13Gray,
                ),
              ],
            ),
            32.h,
            RoleCardWidget(
              title: tr.patientRoleTitle,
              subtitle: tr.patientRoleSubtitle,
              icon: const Icon(
                Icons.person_outline,
                color: AppColors.primary,
                size: 26,
              ),
              isSelected: selectedRole == UserRole.patient,
              onTap: () {
                setState(() {
                  selectedRole = UserRole.patient;
                });
              },
            ),
            16.h,
            RoleCardWidget(
              title: tr.adminRoleTitle,
              subtitle: tr.adminRoleSubtitle,
              icon: const Icon(
                Icons.grid_view_rounded,
                color: AppColors.primary,
                size: 26,
              ),
              isSelected: selectedRole == UserRole.admin,
              onTap: () {
                setState(() {
                  selectedRole = UserRole.admin;
                });
              },
            ),
            const Spacer(),
            CustomButton(title: tr.continueText, onPress: _onContinuePressed),
            20.h,
          ],
        ),
      ),
    );
  }
}
