import 'package:doctor_hunt/apps/core/router/app_router.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_button.dart';
import 'package:doctor_hunt/apps/core/widgets/custom_sized_box.dart';
import 'package:doctor_hunt/apps/core/widgets/auth_background.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:doctor_hunt/apps/features/auth/presentation/widgets/social_buttons_row.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';

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
              50.h,
              Text(
              tr.hello,
                style: context.bold24TextMain,
              ),
              12.h,
              Text(
                tr.loginSubTitle,
                textAlign: TextAlign.center,
                style: context.regular13TextSub,
              ),
              36.h,
              SocialButtonsRow(
                onGoogleTap: () {},
                onFacebookTap: () {},
              ),
              32.h,
              CustomTextField(
                hintText: tr.emailHint,
                keyboardType: TextInputType.emailAddress,
                suffixIcon: const Icon(
                  Icons.check,
                  color: AppColors.textSub,
                  size: 20,
                ),
              ),
              16.h,
              CustomTextField(
                hintText: tr.passwordHint,
                obscureText: isPasswordHidden,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordHidden
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.textSub,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordHidden = !isPasswordHidden;
                    });
                  },
                ),
              ),
              32.h,
              CustomButton(
                title: tr.login,
                onPress: () {},
              ),
              16.h,
              TextButton(
                onPressed: () {},
                child: Text(
                  tr.forgotPassword,
                  style: context.medium14Primary,
                ),
              ),
              40.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tr.dontHaveAccount,
                    style: context.regular14TextSub,
                  ),
                  GestureDetector(
                    onTap: () {
                      const SignUpRoute().go(context);
                    },
                    child: Text(
                      tr.joinUs,
                      style: context.bold14Primary,
                    ),
                  ),
                ],
              ),
              20.h,
            ],
          ),
        ),
      ),
    );
  }
}