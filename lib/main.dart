import 'package:flutter/material.dart';

// Fungsi utama untuk menjalankan aplikasi
void main() {
  runApp(const TwoPageApp());
}

// Widget utama aplikasi (Router)
class TwoPageApp extends StatelessWidget {
  const TwoPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Dua Halaman',
      theme: ThemeData(primarySwatch: Colors.deepPurple, useMaterial3: true),
      // Tentukan halaman awal aplikasi
      home: const HomeScreen(),
    );
  }
}

// ==========================================================
// WIDGET HALAMAN PERTAMA: HOME SCREEN (Halaman Utama)
// Komponen: AppBar, Text, Column, Row, Navigator (Push)
// ==========================================================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. App Bar
      appBar: AppBar(
        title: const Text('Halaman Utama (Home)'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          // 3. Column untuk menata widget secara vertikal
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // 2. Text
              const Text(
                'Selamat Datang! Silakan Pindah ke Halaman Selanjutnya.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // 4. Row untuk menata 3 ikon secara horizontal
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(
                    Icons.looks_one,
                    color: Colors.deepPurple.shade300,
                    size: 40,
                  ),
                  const Text(
                    "=>",
                    style: TextStyle(fontSize: 30, color: Colors.grey),
                  ),
                  Icon(
                    Icons.looks_two,
                    color: Colors.indigo.shade300,
                    size: 40,
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // Tombol untuk Navigasi ke Halaman Kedua
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Pindah ke Halaman Detail (Navigator.push)',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  // 5. Navigator - Pindah ke halaman lain (DetailScreen)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================================
// WIDGET HALAMAN KEDUA: DETAIL SCREEN (Halaman Detail)
// Komponen: AppBar, Text, Column, Navigator (Pop)
// ==========================================================

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. App Bar
      appBar: AppBar(
        title: const Text('Halaman Detail'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          // 3. Column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.task_alt, color: Colors.indigo, size: 80),
              const SizedBox(height: 20),
              // 2. Text
              const Text(
                'Ini Halaman 2!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.indigo,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Gunakan tombol di bawah untuk kembali ke Halaman Utama.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),

              // Tombol untuk kembali
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Kembali ke Home (Navigator.pop)',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  // 5. Navigator - Kembali ke halaman sebelumnya
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
