import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_styles.dart';
import '../models/student_registration.dart';

/// Modal dialog ringkasan data pendaftaran mahasiswa
/// Tampil setelah seluruh validasi form berhasil dilewati
class RegistrationSummaryDialog extends StatelessWidget {
  final StudentRegistration student;

  const RegistrationSummaryDialog({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: AppStyles.roundedLarge,
      ),
      backgroundColor: AppColors.cardSurface,
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 28.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Badge Ikon Sukses Centang Hijau
              Container(
                width: 68.0,
                height: 68.0,
                decoration: const BoxDecoration(
                  color: AppColors.primaryLightGreen,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.check_circle_rounded,
                    color: AppColors.primaryGreen,
                    size: 42.0,
                  ),
                ),
              ),
              const SizedBox(height: AppStyles.spaceM),
              const Text(
                'Pendaftaran Berhasil!',
                style: AppStyles.headingMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppStyles.spaceXS),
              const Text(
                'Berikut adalah ringkasan data mahasiswa yang telah berhasil didaftarkan:',
                style: AppStyles.subtitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppStyles.spaceL),

              // Kotak Rincian Data
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: AppColors.inputFieldBg,
                  borderRadius: AppStyles.roundedMedium,
                  border: Border.all(color: AppColors.borderSubtle),
                ),
                child: Column(
                  children: [
                    _buildDataRow(
                      icon: Icons.person_outline_rounded,
                      label: 'Nama Lengkap',
                      value: student.fullName,
                    ),
                    const Divider(height: 18.0, color: AppColors.borderSubtle),
                    _buildDataRow(
                      icon: Icons.badge_outlined,
                      label: 'NIM',
                      value: student.nim,
                    ),
                    const Divider(height: 18.0, color: AppColors.borderSubtle),
                    _buildDataRow(
                      icon: Icons.mail_outline_rounded,
                      label: 'Email',
                      value: student.email,
                    ),
                    const Divider(height: 18.0, color: AppColors.borderSubtle),
                    _buildDataRow(
                      icon: Icons.wc_rounded,
                      label: 'Jenis Kelamin',
                      value: student.gender,
                    ),
                    const Divider(height: 18.0, color: AppColors.borderSubtle),
                    _buildDataRow(
                      icon: Icons.school_outlined,
                      label: 'Program Studi',
                      value: student.studyProgram,
                    ),
                    const Divider(height: 18.0, color: AppColors.borderSubtle),
                    _buildDataRow(
                      icon: Icons.interests_outlined,
                      label: 'Hobi',
                      value: student.hobbies.join(', '),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppStyles.spaceXL),

              // Tombol Tutup / Selesai
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: AppStyles.roundedMedium,
                    ),
                  ),
                  child: const Text('Tutup & Selesai', style: AppStyles.buttonText),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDataRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18.0, color: AppColors.textSecondary),
        const SizedBox(width: AppStyles.spaceS),
        SizedBox(
          width: 95.0,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        const Text(': ', style: TextStyle(color: AppColors.textSecondary)),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}

