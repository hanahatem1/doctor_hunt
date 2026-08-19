import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final TextStyle? textStyle;
  final Color? buttonColor;
  final double width;
  final double height;
  final Gradient? gradient;
  final VoidCallback onPress;
  final VoidCallback? onDisabledPressed;
  final double borderRadius;
  final bool isDisabled;
  final bool isLoading;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final Border? border;
  final Color borderColor;
  final Color prefixIconColor;
  final Color suffixIconColor;
  final double? titleSize;
  final IconData? prefixIcon;
  final double prefixIconSize;

  const CustomButton({
    super.key,
    required this.title,
    this.titleColor = AppColors.white,
    this.buttonColor = AppColors.primary,
    this.borderColor = Colors.transparent,
    this.gradient,
    this.width = double.infinity,
    this.height = 52,
    required this.onPress,
    this.onDisabledPressed,
    this.textStyle,
    this.borderRadius = 12,
    this.prefixIconPath,
    this.suffixIconPath,
    this.border,
    this.titleSize,
    this.isDisabled = false,
    this.isLoading = false,
    this.prefixIconColor = AppColors.white,
    this.suffixIconColor = AppColors.white,
    this.prefixIcon,
    this.prefixIconSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
          if (isDisabled) {
            onDisabledPressed?.call();
          } else if (!isLoading) {
            onPress.call();
          }
        },
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isDisabled ? AppColors.textBorders : buttonColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: border ?? Border.all(color: borderColor),
            gradient: gradient,
          ),
          child: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (prefixIconPath != null || prefixIcon != null) ...[
                      if (prefixIcon != null)
                        Icon(
                          prefixIcon,
                          size: prefixIconSize,
                          color: prefixIconColor,
                        )
                      else
                        Image.asset(
                          prefixIconPath!,
                          height: 24,
                          width: 24,
                        ),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: textStyle ??
                          context.bold16White.copyWith(
                            color: titleColor,
                            fontSize: titleSize,
                          ),
                      maxLines: 1,
                    ),
                    if (suffixIconPath != null) ...[
                      const SizedBox(width: 8),
                      Image.asset(
                        suffixIconPath!,
                        height: 24,
                        width: 24,
                      ),
                    ],
                  ],
                ),
        ),
      ),
    );
  }
}

class CustomButtonOutlined extends CustomButton {
  const CustomButtonOutlined({
    super.key,
    required super.title,
    required super.onPress,
    super.prefixIcon,
    super.titleColor = AppColors.textSub,
    super.buttonColor = AppColors.primaryLight,
    super.prefixIconColor = AppColors.textSub,
    super.width = double.infinity,
    super.height = 52,
    super.onDisabledPressed,
    super.border,
    super.borderColor = AppColors.primary,
    super.textStyle,
    super.borderRadius = 12,
    super.prefixIconPath,
    super.suffixIconPath,
    super.titleSize,
    super.isDisabled = false,
    super.isLoading = false,
  });
}
