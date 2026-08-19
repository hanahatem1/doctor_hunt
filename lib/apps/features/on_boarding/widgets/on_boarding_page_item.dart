import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_button.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_sized_box.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';

class OnboardingPageItem extends StatelessWidget {
  final String centerImage;
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onNextPressed;
  final VoidCallback onSkipPressed;

  const OnboardingPageItem({
    super.key,
    required this.centerImage,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onNextPressed,
    required this.onSkipPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [  
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.boxShadow,
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(centerImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  40.h,
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: context.bold24GrayDark,
                  ),
                  16.h,
                  Text(
                    description + description,
                    textAlign: TextAlign.center,
                    style: context.regular14TextSub,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: CustomButton(title: buttonText, onPress: onNextPressed),
          ),
          TextButton(
            onPressed: onSkipPressed,
            child: Text(tr.skip, style: context.regular14TextSub),
          ),
          16.h,
        ],
      ),
    );
  }
}
