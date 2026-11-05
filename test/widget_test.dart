import 'package:flutter_test/flutter_test.dart';
import 'package:tugas_formulir/main.dart';

void main() {
  testWidgets('Smoke test render form registrasi mahasiswa', (WidgetTester tester) async {
    // Build aplikasi registrasi mahasiswa
    await tester.pumpWidget(const StudentRegistrationApp());

    // Memastikan judul halaman registrasi berhasil dirender
    expect(find.text('Registrasi Mahasiswa'), findsOneWidget);
    expect(find.text('Daftar Sekarang'), findsOneWidget);
  });
}
