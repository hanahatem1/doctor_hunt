import 'package:doctor_hunt/apps/core/router/app_router.dart';
import 'package:doctor_hunt/apps/features/role_selection/widgets/role_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/generated/images_assets.dart';
import 'package:go_router/go_router.dart';

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
        context.pushReplacement(AppRouter.kLogin);
    } else {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
             AppImages.splash1 
            )
          ),

          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              AppImages.splash2
            )
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  Column(
                    children: [
                      Image.asset(
                        AppImages.logo, 
                        height: 50,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Doctor Hunt',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF222222),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  const Text(
                    'Choose your role',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF222222),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'The selected role determines the experience and\navailable features.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.4,
                      color: Color(0xFF8A94A6),
                    ),
                  ),

                  const SizedBox(height: 32),

                  RoleCardWidget(
                    title: 'Patient',
                    subtitle:
                        'Find doctors, book appointments, and manage your medical records.',
                    icon: const Icon(
                      Icons.person_outline,
                      color: Color(0xFF0FCE92),
                      size: 26,
                    ),
                    isSelected: selectedRole == UserRole.patient,
                    onTap: () {
                      setState(() {
                        selectedRole = UserRole.patient;
                      });
                    },
                  ),

                  const SizedBox(height: 16),

                  RoleCardWidget(
                    title: 'Admin',
                    subtitle:
                        'Manage doctors, appointments, users, and the platform.',
                    icon: const Icon(
                      Icons.grid_view_rounded,
                      color: Color(0xFF0FCE92),
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

                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _onContinuePressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0FCE92),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}