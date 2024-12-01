import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Judul dan deskripsi aplikasi
            const Text(
              'Aplikasi Prediksi Laptop',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Aplikasi ini membantu Anda untuk memilih laptop terbaik sesuai dengan kebutuhan Anda berdasarkan spesifikasi yang Anda pilih, seperti RAM, prosesor, dan fitur lainnya.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),

            // Bagian Logo Aplikasi (Jika ada gambar logo)
            Center(
              child: Image.asset(
                'assets/logo.png', // Pastikan Anda menambahkan logo aplikasi di folder assets
                height: 150,
                width: 150,
              ),
            ),
            const SizedBox(height: 20),

            // Bagian Tentang Developer
            const Text(
              'Dikembangkan oleh:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Developer: Kelompok 1\n'
              'Kontak: 0818181818\n'
              'Versi Aplikasi: New Update',
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),

            // Tombol kembali ke halaman utama
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Kembali ke halaman sebelumnya
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent,
              ),
              child: const Text('Kembali ke Halaman Utama'),
            ),
          ],
        ),
      ),
    );
  }
}
