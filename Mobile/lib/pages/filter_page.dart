import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String selectedRAM = '8GB';
  String selectedProcessor = 'Intel i5';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filter Laptop')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text('Pilih RAM'),
                trailing: DropdownButton<String>(
                  value: selectedRAM,
                  items: ['4GB', '8GB', '16GB'].map((ram) {
                    return DropdownMenuItem(
                      value: ram,
                      child: Text(ram),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedRAM = value!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text('Pilih Prosesor'),
                trailing: DropdownButton<String>(
                  value: selectedProcessor,
                  items: ['Intel i3', 'Intel i5', 'Intel i7'].map((processor) {
                    return DropdownMenuItem(
                      value: processor,
                      child: Text(processor),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedProcessor = value!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text('Lihat Hasil'),
            ),
          ],
        ),
      ),
    );
  }
}
