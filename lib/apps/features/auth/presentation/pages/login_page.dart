import 'package:doctor_hunt/apps/core/router/app_router.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/auth_background.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/custom_main_button.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:doctor_hunt/generated/images_assets.dart';
import 'package:go_router/go_router.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text(
                'Welcome back',
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
              const SizedBox(height: 36),
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
              const SizedBox(height: 32),

              const CustomTextField(
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                suffixIcon: Icon(Icons.check, color: Color(0xFF677294), size: 20),
              ),
              const SizedBox(height: 16),

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
              const SizedBox(height: 32),

              CustomMainButton(
                text: 'Login',
                onPressed: () {},
              ),
              const SizedBox(height: 16),

              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot password',
                  style: TextStyle(
                    color: Color(0xFF0FCE92),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Color(0xFF677294), fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushReplacement(AppRouter.kSignUp);
                    },
                    child: const Text(
                      'Join us',
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