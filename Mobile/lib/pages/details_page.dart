import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil data dari route arguments
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: Text(args['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menampilkan informasi detail laptop
            Text(
              'Spesifikasi Laptop',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Nama Laptop: ${args['name']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Spesifikasi: ${args['specs']}',
              style: TextStyle(fontSize: 18),
            ),
            // Anda bisa menambahkan lebih banyak informasi detail jika diperlukan
          ],
        ),
      ),
    );
  }
}
