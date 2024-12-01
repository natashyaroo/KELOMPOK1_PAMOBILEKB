import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prediksi Laptop'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Header Section
            Text(
              'Selamat Datang di Aplikasi Prediksi Laptop!',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Card for laptop category or filter options
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: const Icon(
                  Icons.laptop,
                  size: 40,
                  color: Colors.blueAccent,
                ),
                title: const Text(
                  'Cari Laptop Sesuai Kebutuhan',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                    'Temukan laptop terbaik berdasarkan kategori yang Anda butuhkan'),
                onTap: () {
                  Navigator.pushNamed(context, '/filter');
                },
              ),
            ),
            const SizedBox(height: 20),

            // Card for predictions
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: const Icon(
                  Icons.search,
                  size: 40,
                  color: Colors.greenAccent,
                ),
                title: const Text(
                  'Prediksi Laptop',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                    'Dapatkan prediksi laptop yang sesuai dengan spesifikasi Anda'),
                onTap: () {
                  Navigator.pushNamed(context, '/results');
                },
              ),
            ),
            const SizedBox(height: 20),

            // Card for settings
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: const Icon(
                  Icons.settings,
                  size: 40,
                  color: Colors.orangeAccent,
                ),
                title: const Text(
                  'Pengaturan Tema',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Ubah tema aplikasi sesuai preferensi Anda'),
                onTap: () {
                  Navigator.pushNamed(context, '/settings');
                },
              ),
            ),
            const SizedBox(height: 20),

            // Card for About page
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: const Icon(
                  Icons.info,
                  size: 40,
                  color: Colors.purpleAccent,
                ),
                title: const Text(
                  'Tentang Aplikasi',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Pelajari lebih lanjut tentang aplikasi ini'),
                onTap: () {
                  Navigator.pushNamed(context, '/about');
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
