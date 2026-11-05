import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_styles.dart';

/// Komponen pemilihan Hobi dengan Checkbox (Multi-select)
/// Ditata dalam grid/kartu rapi dan bersih
class HobbySelector extends StatelessWidget {
  final Map<String, bool> hobbies;
  final Function(String, bool) onHobbyChanged;
  final String? errorMessage;

  const HobbySelector({
    super.key,
    required this.hobbies,
    required this.onHobbyChanged,
    this.errorMessage,
  });

  static const Map<String, IconData> hobbyIcons = {
    'Membaca': Icons.menu_book_rounded,
    'Musik': Icons.music_note_rounded,
    'Olahraga': Icons.sports_soccer_rounded,
    'Fotografi': Icons.camera_alt_rounded,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text('Hobi', style: AppStyles.label),
            SizedBox(width: AppStyles.spaceXS),
            Text('(Boleh pilih lebih dari satu)', style: AppStyles.subtitle),
          ],
        ),
        const SizedBox(height: AppStyles.spaceS),
        // Grid 2x2 opsi hobi
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: AppStyles.spaceS,
          crossAxisSpacing: AppStyles.spaceM,
          childAspectRatio: 2.8,
          children: hobbies.keys.map((hobby) {
            final bool isChecked = hobbies[hobby] ?? false;
            final IconData icon = hobbyIcons[hobby] ?? Icons.interests_rounded;

            return InkWell(
              onTap: () => onHobbyChanged(hobby, !isChecked),
              borderRadius: AppStyles.roundedMedium,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: isChecked ? AppColors.primaryLightGreen : AppColors.inputFieldBg,
                  borderRadius: AppStyles.roundedMedium,
                  border: Border.all(
                    color: isChecked ? AppColors.primaryGreen : Colors.transparent,
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      activeColor: AppColors.primaryGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      onChanged: (val) => onHobbyChanged(hobby, val ?? false),
                    ),
                    Icon(
                      icon,
                      size: 18.0,
                      color: isChecked ? AppColors.primaryDarkGreen : AppColors.textSecondary,
                    ),
                    const SizedBox(width: AppStyles.spaceXS),
                    Expanded(
                      child: Text(
                        hobby,
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: isChecked ? FontWeight.w600 : FontWeight.w400,
                          color: isChecked ? AppColors.primaryDarkGreen : AppColors.textPrimary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        if (errorMessage != null) ...[
          const SizedBox(height: AppStyles.spaceXS),
          Text(errorMessage!, style: AppStyles.errorText),
        ],
      ],
    );
  }
}

