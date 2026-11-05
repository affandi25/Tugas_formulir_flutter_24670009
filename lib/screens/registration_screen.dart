import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_styles.dart';
import '../core/utils/form_validators.dart';
import '../models/student_registration.dart';
import '../widgets/app_header.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/gender_selector.dart';
import '../widgets/hobby_selector.dart';
import '../widgets/program_dropdown.dart';
import '../widgets/registration_summary_dialog.dart';

/// Halaman utama Formulir Pendaftaran Mahasiswa
/// Menggabungkan seluruh widget modular, validasi terpusat, dan dialog ringkasan
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  // Text Controllers
  final _nameController = TextEditingController();
  final _nimController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Selection States
  String? _selectedGender = 'Laki-laki';
  String? _selectedProgram;
  final Map<String, bool> _hobbies = {
    'Membaca': false,
    'Musik': false,
    'Olahraga': false,
    'Fotografi': false,
  };
  bool _agreedToTerms = false;

  // Custom Selection Error States
  String? _genderError;
  String? _hobbyError;
  String? _termsError;

  // Daftar Program Studi
  final List<String> _programs = const [
    'S1 Teknik Informatika',
    'S1 Sistem Informasi',
    'S1 Bisnis Digital',
    'S1 Pendidikan Teknologi Informasi',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _nimController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    // Jalankan validasi pada TextFormField & Dropdown
    final bool isFormValid = _formKey.currentState?.validate() ?? false;

    // Validasi Jenis Kelamin
    final bool isGenderValid = _selectedGender != null && _selectedGender!.isNotEmpty;

    // Validasi Hobi (minimal 1 hobi dipilih)
    final List<String> selectedHobbies = _hobbies.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();
    final bool isHobbyValid = selectedHobbies.isNotEmpty;

    // Validasi Syarat & Ketentuan
    final bool isTermsValid = _agreedToTerms;

    setState(() {
      _genderError = isGenderValid ? null : 'Pilih jenis kelamin Anda';
      _hobbyError = isHobbyValid ? null : 'Pilih minimal satu hobi Anda';
      _termsError = isTermsValid ? null : 'Anda wajib menyetujui syarat & ketentuan';
    });

    // Jika seluruh validasi berhasil
    if (isFormValid && isGenderValid && isHobbyValid && isTermsValid) {
      final student = StudentRegistration(
        fullName: _nameController.text.trim(),
        nim: _nimController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        gender: _selectedGender!,
        hobbies: selectedHobbies,
        studyProgram: _selectedProgram!,
        agreedToTerms: _agreedToTerms,
      );

      // Tampilkan Modal Dialog Ringkasan Data
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => RegistrationSummaryDialog(student: student),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Melengkung (Curved Organic Header sesuai gambar referensi)
            const AppHeader(),

            // Form Konten dengan Padding Samping
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 4.0, 24.0, 36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 1. Field Nama Lengkap
                    CustomTextField(
                      controller: _nameController,
                      label: 'Nama Lengkap',
                      hint: 'Masukkan nama lengkap',
                      prefixIcon: Icons.person_outline_rounded,
                      validator: FormValidators.validateFullName,
                    ),
                    const SizedBox(height: AppStyles.spaceM),

                    // 2. Field NIM (Hanya Angka, Min 8 Digit)
                    CustomTextField(
                      controller: _nimController,
                      label: 'NIM (Nomor Induk Mahasiswa)',
                      hint: 'Contoh: 22001001 (min. 8 digit)',
                      prefixIcon: Icons.badge_outlined,
                      keyboardType: TextInputType.number,
                      validator: FormValidators.validateNIM,
                    ),
                    const SizedBox(height: AppStyles.spaceM),

                    // 3. Field Email (Format Valid)
                    CustomTextField(
                      controller: _emailController,
                      label: 'Email',
                      hint: 'nama@email.com',
                      prefixIcon: Icons.mail_outline_rounded,
                      keyboardType: TextInputType.emailAddress,
                      validator: FormValidators.validateEmail,
                    ),
                    const SizedBox(height: AppStyles.spaceM),

                    // 4. Field Password (Min 8 Karakter + Toggle Mata)
                    CustomTextField(
                      controller: _passwordController,
                      label: 'Password',
                      hint: 'Minimal 8 karakter',
                      prefixIcon: Icons.lock_outline_rounded,
                      isPassword: true,
                      validator: FormValidators.validatePassword,
                    ),
                    const SizedBox(height: AppStyles.spaceL),

                    // 5. Radio Jenis Kelamin (Laki-laki / Perempuan)
                    GenderSelector(
                      selectedGender: _selectedGender,
                      onChanged: (val) {
                        setState(() {
                          _selectedGender = val;
                          _genderError = null;
                        });
                      },
                      errorMessage: _genderError,
                    ),
                    const SizedBox(height: AppStyles.spaceL),

                    // 6. Dropdown Program Studi
                    ProgramDropdown(
                      selectedProgram: _selectedProgram,
                      programs: _programs,
                      onChanged: (val) {
                        setState(() {
                          _selectedProgram = val;
                        });
                      },
                      validator: (val) => FormValidators.validateDropdown(
                        val,
                        'Program studi',
                      ),
                    ),
                    const SizedBox(height: AppStyles.spaceL),

                    // 7. Checkbox Hobi (Boleh lebih dari satu)
                    HobbySelector(
                      hobbies: _hobbies,
                      onHobbyChanged: (hobby, isChecked) {
                        setState(() {
                          _hobbies[hobby] = isChecked;
                          _hobbyError = null;
                        });
                      },
                      errorMessage: _hobbyError,
                    ),
                    const SizedBox(height: AppStyles.spaceL),

                    // 8. Checkbox Persetujuan Syarat & Ketentuan
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: Checkbox(
                            value: _agreedToTerms,
                            activeColor: AppColors.primaryGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            onChanged: (val) {
                              setState(() {
                                _agreedToTerms = val ?? false;
                                if (_agreedToTerms) _termsError = null;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: AppStyles.spaceS),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _agreedToTerms = !_agreedToTerms;
                                if (_agreedToTerms) _termsError = null;
                              });
                            },
                            child: const Text(
                              'Saya menyetujui seluruh syarat & ketentuan pendaftaran.',
                              style: TextStyle(
                                fontSize: 13.0,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (_termsError != null) ...[
                      const SizedBox(height: AppStyles.spaceXS),
                      Text(_termsError!, style: AppStyles.errorText),
                    ],
                    const SizedBox(height: AppStyles.spaceXL),

                    // 9. Tombol Submit (Simpan / Daftar Sekarang)
                    SizedBox(
                      height: 54.0,
                      child: ElevatedButton(
                        onPressed: _handleSubmit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryGreen,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: AppStyles.roundedMedium,
                          ),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: AppStyles.buttonText,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppStyles.spaceL),

                    // Footer Link "Already have an account? Log in" (Persis referensi)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                            fontSize: 13.5,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Text(
                          'Log in',
                          style: TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryGreen,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

