import 'package:doctor_hunt/apps/core/router/app_router.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/auth_background.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/custom_main_button.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/generated/images_assets.dart';
import 'package:go_router/go_router.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isPasswordHidden = true;
  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text(
                'Join us to start searching',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF222222),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'You can search course, apply course and find\nscholarship for abroad studies',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  height: 1.4,
                  color: Color(0xFF677294),
                ),
              ),
              const SizedBox(height: 32),

              Row(
                children: [
                  SocialButton(
                    title: 'Google',
                    iconPath: AppImages.google,
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  SocialButton(
                    title: 'Facebook',
                    iconPath: AppImages.facebook,
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 28),

              const CustomTextField(
                hintText: 'Name',
              ),
              const SizedBox(height: 16),

              const CustomTextField(
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              // Password Field
              CustomTextField(
                hintText: 'Password',
                obscureText: isPasswordHidden,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordHidden ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: const Color(0xFF677294),
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordHidden = !isPasswordHidden;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      value: isAgreed,
                      shape: const CircleBorder(),
                      activeColor: const Color(0xFF0FCE92),
                      onChanged: (val) {
                        setState(() {
                          isAgreed = val ?? false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'I agree with the Terms of Service & Privacy Policy',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF677294),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),

              CustomMainButton(
                text: 'Sign up',
                onPressed: () {},
              ),
              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Have an account? ',
                    style: TextStyle(color: Color(0xFF677294), fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                    context.pushReplacement(AppRouter.kLogin);
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        color: Color(0xFF0FCE92),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}