import 'package:doctor_hunt/apps/core/widgets/custom_sized_box.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/social_button.dart';
import 'package:doctor_hunt/generated/images_assets.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';

class SocialButtonsRow extends StatelessWidget {
  final VoidCallback onGoogleTap;
  final VoidCallback onFacebookTap;

  const SocialButtonsRow({
    super.key,
    required this.onGoogleTap,
    required this.onFacebookTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SocialButton(
          title: tr.google,
          iconPath: AppImages.pngGoogle,
          onTap: onGoogleTap,
        ),
        16.w,
        SocialButton(
          title: tr.facebook,
          iconPath: AppImages.pngFacebook,
          onTap: onFacebookTap,
        ),
      ],
    );
  }
}
