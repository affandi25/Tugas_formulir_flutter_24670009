import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_styles.dart';

/// Komponen Dropdown Program Studi menggunakan DropdownButtonFormField
/// Memiliki dekorasi serasi dengan CustomTextField
class ProgramDropdown extends StatelessWidget {
  final String? selectedProgram;
  final List<String> programs;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;

  const ProgramDropdown({
    super.key,
    required this.selectedProgram,
    required this.programs,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Program Studi', style: AppStyles.label),
        const SizedBox(height: AppStyles.spaceS),
        DropdownButtonFormField<String>(
          value: selectedProgram,
          items: programs.map((program) {
            return DropdownMenuItem<String>(
              value: program,
              child: Text(
                program,
                style: AppStyles.inputText,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
          onChanged: onChanged,
          validator: validator,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.textSecondary,
          ),
          dropdownColor: AppColors.cardSurface,
          borderRadius: AppStyles.roundedMedium,
          decoration: InputDecoration(
            hintText: 'Pilih Program Studi',
            hintStyle: AppStyles.inputHint,
            filled: true,
            fillColor: AppColors.inputFieldBg,
            prefixIcon: const Icon(
              Icons.school_outlined,
              color: AppColors.textSecondary,
              size: 22.0,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18.0,
              vertical: 16.0,
            ),
            border: OutlineInputBorder(
              borderRadius: AppStyles.roundedMedium,
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: AppStyles.roundedMedium,
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: AppStyles.roundedMedium,
              borderSide: const BorderSide(
                color: AppColors.borderFocus,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: AppStyles.roundedMedium,
              borderSide: const BorderSide(
                color: AppColors.errorRed,
                width: 1.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: AppStyles.roundedMedium,
              borderSide: const BorderSide(
                color: AppColors.errorRed,
                width: 1.5,
              ),
            ),
            errorStyle: AppStyles.errorText,
          ),
        ),
      ],
    );
  }
}

