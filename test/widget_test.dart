import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Ganti 'tugas_1' dengan nama folder proyek Anda jika berbeda
import 'package:tugas_1/main.dart';

void main() {
  // Membungkus pengujian dalam blok main() eksplisit adalah praktik yang baik
  group('Aplikasi Dua Halaman Test', () {
    testWidgets('Memastikan HomeScreen dirender dengan tombol navigasi', (
      WidgetTester tester,
    ) async {
      // Membangun aplikasi dan memicu frame
      await tester.pumpWidget(const TwoPageApp());

      // 1. Verifikasi teks utama "Selamat Datang!" ada di layar.
      expect(
        find.text('Selamat Datang! Silakan Pindah ke Halaman Selanjutnya.'),
        findsOneWidget,
      );

      // 2. Verifikasi tombol navigasi (ElevatedButton) ditemukan.
      expect(
        find.widgetWithText(
          ElevatedButton,
          'Pindah ke Halaman Detail (Navigator.push)',
        ),
        findsOneWidget,
      );

      // 3. Verifikasi ikon halaman 1 dan 2 ada
      expect(find.byIcon(Icons.looks_one), findsOneWidget);
      expect(find.byIcon(Icons.looks_two), findsOneWidget);

      // 4. Tekan tombol untuk navigasi
      await tester.tap(
        find.widgetWithText(
          ElevatedButton,
          'Pindah ke Halaman Detail (Navigator.push)',
        ),
      );

      // Memicu frame (widget test perlu waktu untuk animasi navigasi)
      await tester.pumpAndSettle();

      // 5. Verifikasi bahwa kita telah pindah ke Halaman Detail (Halaman 2).
      expect(find.text('Ini Halaman 2!'), findsOneWidget);
      expect(
        find.text('Halaman Utama (Home)'),
        findsNothing,
      ); // Pastikan Halaman Home sudah hilang
    });
  });
}
