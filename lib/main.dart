import 'package:flutter/material.dart';
import 'core/constants/app_colors.dart';
import 'screens/registration_screen.dart';

void main() {
  runApp(const StudentRegistrationApp());
}

/// Root widget aplikasi Pendaftaran Mahasiswa Baru
class StudentRegistrationApp extends StatelessWidget {
  const StudentRegistrationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pendaftaran Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.appBackground,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryGreen,
          primary: AppColors.primaryGreen,
          surface: AppColors.appBackground,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.appBackground,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
      ),
      home: const RegistrationScreen(),
    );
  }
}
