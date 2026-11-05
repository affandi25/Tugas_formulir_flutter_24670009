/// Model data untuk menampung seluruh payload formulir pendaftaran mahasiswa
class StudentRegistration {
  final String fullName;
  final String nim;
  final String email;
  final String password;
  final String gender;
  final List<String> hobbies;
  final String studyProgram;
  final bool agreedToTerms;

  const StudentRegistration({
    required this.fullName,
    required this.nim,
    required this.email,
    required this.password,
    required this.gender,
    required this.hobbies,
    required this.studyProgram,
    required this.agreedToTerms,
  });
}

