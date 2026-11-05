import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

/// Header melengkung (Curved Organic Header) persis sesuai gambar referensi
/// Memiliki kurva asimetris organik di bagian bawah dan emblem logo toga di tengah
class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;
    const double headerHeight = 230.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Curved Organic Dark Green Header
        ClipPath(
          clipper: OrganicHeaderClipper(),
          child: Container(
            height: headerHeight + topPadding,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF091F14), // Dark deep forest green
                  Color(0xFF143825),
                  Color(0xFF1E4D34),
                  Color(0xFF2D6A4F),
                ],
              ),
            ),
            child: Stack(
              children: [
                // Ornamen Lingkaran Halus Latar Belakang (Memberi kedalaman tekstur)
                Positioned(
                  top: -20,
                  right: -30,
                  child: Container(
                    width: 160.0,
                    height: 160.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.04),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: -20,
                  child: Container(
                    width: 140.0,
                    height: 140.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.03),
                    ),
                  ),
                ),

                // Tombol Back di Kiri Atas (Persis referensi)
                Positioned(
                  top: topPadding + 12.0,
                  left: 20.0,
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.15),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.25),
                        width: 1.0,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 16.0,
                      ),
                    ),
                  ),
                ),

                // Emblem Logo Toga Akademik di Tengah (Pengganti logo di gambar referensi)
                Positioned.fill(
                  top: topPadding - 10.0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 82.0,
                          height: 82.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.12),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.35),
                              width: 1.5,
                            ),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 62.0,
                                height: 62.0,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.school_rounded,
                                    color: AppColors.primaryGreen,
                                    size: 34.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // 2. Baris Judul "Register" & Subtitle dengan Aksen Ikon Kanan (Persis referensi)
        Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 18.0, 24.0, 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryDarkGreen,
                      letterSpacing: -0.5,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Create your new account',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              // Aksen ornamen di sisi kanan judul (seperti daun di referensi)
              Container(
                width: 44.0,
                height: 44.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryLightGreen.withOpacity(0.7),
                ),
                child: const Center(
                  child: Icon(
                    Icons.school_rounded,
                    color: AppColors.primaryGreen,
                    size: 24.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Custom Clipper untuk menghasilkan kurva asimetris organik melengkung
/// Sisi kiri turun lebih rendah dan melengkung naik secara dinamis ke sisi kanan
class OrganicHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height);

    // Kurva Bézier kubik yang mengalir halus dari kiri bawah naik ke kanan
    path.cubicTo(
      size.width * 0.35,
      size.height,
      size.width * 0.65,
      size.height - 65.0,
      size.width,
      size.height - 52.0,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
