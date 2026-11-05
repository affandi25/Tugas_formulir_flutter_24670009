import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Konstanta tipografi, border radius, dan spacing
/// Mengacu pada prinsip UI/UX Pro Max & Impeccable (Operate Mode)
class AppStyles {
  // Border Radius
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 16.0;
  static const double radiusLarge = 24.0;
  static const double radiusCircular = 999.0;

  static const BorderRadius roundedMedium = BorderRadius.all(Radius.circular(radiusMedium));
  static const BorderRadius roundedLarge = BorderRadius.all(Radius.circular(radiusLarge));

  // Spacing & Padding
  static const double spaceXS = 4.0;
  static const double spaceS = 8.0;
  static const double spaceM = 16.0;
  static const double spaceL = 24.0;
  static const double spaceXL = 32.0;

  // Typography
  static const TextStyle headingLarge = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryDarkGreen,
    letterSpacing: -0.5,
  );

  static const TextStyle headingMedium = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  static const TextStyle label = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle inputText = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static const TextStyle inputHint = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0.3,
  );

  static const TextStyle errorText = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: AppColors.errorRed,
  );
}

