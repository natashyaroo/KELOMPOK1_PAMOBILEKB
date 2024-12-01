import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> laptops = [
      {
        'name': 'Laptop A',
        'specs': 'Intel i5, 8GB RAM, 512GB SSD',
      },
      {
        'name': 'Laptop B',
        'specs': 'Intel i7, 16GB RAM, 1TB SSD',
      },
      {
        'name': 'Laptop C',
        'specs': 'Intel i3, 4GB RAM, 256GB SSD',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Prediksi'),
      ),
      body: ListView.builder(
        itemCount: laptops.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const Icon(
                Icons.laptop,
                size: 40,
                color: Colors.blueAccent,
              ),
              title: Text(
                laptops[index]['name']!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(laptops[index]['specs']!),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: {
                    'name': laptops[index]['name']!,
                    'specs': laptops[index]['specs']!,
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
