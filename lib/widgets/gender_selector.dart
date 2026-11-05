import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_styles.dart';

/// Komponen pemilihan Jenis Kelamin menggunakan Radio Button
/// Ditata rapi dalam 2 kartu horizontal modern
class GenderSelector extends StatelessWidget {
  final String? selectedGender;
  final ValueChanged<String?> onChanged;
  final String? errorMessage;

  const GenderSelector({
    super.key,
    required this.selectedGender,
    required this.onChanged,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Jenis Kelamin', style: AppStyles.label),
        const SizedBox(height: AppStyles.spaceS),
        Row(
          children: [
            Expanded(
              child: _buildGenderCard(
                title: 'Laki-laki',
                value: 'Laki-laki',
                icon: Icons.male_rounded,
              ),
            ),
            const SizedBox(width: AppStyles.spaceM),
            Expanded(
              child: _buildGenderCard(
                title: 'Perempuan',
                value: 'Perempuan',
                icon: Icons.female_rounded,
              ),
            ),
          ],
        ),
        if (errorMessage != null) ...[
          const SizedBox(height: AppStyles.spaceXS),
          Text(errorMessage!, style: AppStyles.errorText),
        ],
      ],
    );
  }

  Widget _buildGenderCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    final bool isSelected = selectedGender == value;

    return InkWell(
      onTap: () => onChanged(value),
      borderRadius: AppStyles.roundedMedium,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryLightGreen : AppColors.inputFieldBg,
          borderRadius: AppStyles.roundedMedium,
          border: Border.all(
            color: isSelected ? AppColors.primaryGreen : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Radio<String>(
              value: value,
              groupValue: selectedGender,
              activeColor: AppColors.primaryGreen,
              onChanged: onChanged,
            ),
            Icon(
              icon,
              size: 20.0,
              color: isSelected ? AppColors.primaryDarkGreen : AppColors.textSecondary,
            ),
            const SizedBox(width: AppStyles.spaceXS),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected ? AppColors.primaryDarkGreen : AppColors.textPrimary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

