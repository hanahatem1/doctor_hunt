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
              40.h,
              Text(
                tr.signUpTitle,
                style: context.bold24TextMain,
              ),
              12.h,
              Text(
                tr.signUpSubTitle,
                textAlign: TextAlign.center,
                style: context.regular13TextSub,
              ),
              32.h,
              SocialButtonsRow(
                onGoogleTap: () {},
                onFacebookTap: () {},
              ),
              28.h,
              CustomTextField(
                hintText: tr.nameHint,
              ),
              16.h,
              CustomTextField(
                hintText: tr.emailHint,
                keyboardType: TextInputType.emailAddress,
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
              16.h,
              Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      value: isAgreed,
                      shape: const CircleBorder(),
                      activeColor: AppColors.primary,
                      onChanged: (val) {
                        setState(() {
                          isAgreed = val ?? false;
                        });
                      },
                    ),
                  ),
                  8.w,
                  Expanded(
                    child: Text(
                      tr.termsAgreement,
                      style: context.regular12TextSub,
                    ),
                  ),
                ],
              ),
              28.h,
              CustomButton(
                title: tr.signUp,
                onPress: () {},
              ),
              24.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tr.haveAnAccount,
                    style: context.regular14TextSub,
                  ),
                  GestureDetector(
                    onTap: () {
                      const LoginRoute().go(context);
                    },
                    child: Text(
                      tr.logIn,
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