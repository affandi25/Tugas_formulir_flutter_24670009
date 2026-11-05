/// Pure validation functions untuk form pendaftaran mahasiswa
/// Memenuhi semua kriteria pengujian pada Modul Praktikum Forms (Slide 15-19)
class FormValidators {
  /// Validasi nama lengkap: wajib diisi, tidak boleh hanya spasi, min 3 karakter
  static String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nama lengkap wajib diisi';
    }
    if (value.trim().length < 3) {
      return 'Nama lengkap minimal 3 karakter';
    }
    return null;
  }

  /// Validasi NIM: wajib diisi, harus berupa angka, minimal 8 digit
  static String? validateNIM(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'NIM wajib diisi';
    }
    final trimmed = value.trim();
    if (!RegExp(r'^[0-9]+$').hasMatch(trimmed)) {
      return 'NIM harus berupa angka';
    }
    if (trimmed.length < 8) {
      return 'NIM minimal harus 8 digit';
    }
    return null;
  }

  /// Validasi Email: format email harus valid
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email wajib diisi';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)+$',
    );
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Format email tidak valid (contoh: nama@email.com)';
    }
    return null;
  }

  /// Validasi Password: minimal 8 karakter
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password wajib diisi';
    }
    if (value.length < 8) {
      return 'Password minimal 8 karakter';
    }
    return null;
  }

  /// Validasi Dropdown: memastikan opsi telah dipilih
  static String? validateDropdown(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName wajib dipilih';
    }
    return null;
  }
}

