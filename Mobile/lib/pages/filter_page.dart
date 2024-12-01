import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String selectedRAM = '8';
  String selectedStorage = '512';
  String selectedVGATier = '2';
  String selectedProcessorTier = '2';

  TextEditingController priceController = TextEditingController();

  final List<String> ramOptions = ['4', '8', '16', '32'];
  final List<String> storageOptions = ['256', '512', '1024', '2048'];
  final List<String> vgaTierOptions = ['1', '2', '3'];
  final List<String> processorTierOptions = ['1', '2', '3', '4'];

  Future<void> predictLaptopClass() async {
    if (priceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Silakan masukkan harga laptop')));
      return;
    }

    Map<String, dynamic> requestData = {
      'data': {
        'Penyimpanan': int.parse(selectedStorage),
        'RAM_Numeric': int.parse(selectedRAM),
        'Harga': int.parse(priceController.text),
        'Tier VGA': selectedVGATier,
        'Tier Processor': selectedProcessorTier
      }
    };

    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/predict'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(requestData),
      );

      if (response.statusCode == 200) {
        var result = json.decode(response.body);

        Navigator.pushNamed(context, '/results', arguments: {
          'prediction': result['prediction']['class'],
          'confidence': result['prediction']['confidence']
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Gagal melakukan prediksi: ${response.body}')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filter Laptop')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: const Text('Pilih RAM (GB)'),
                trailing: DropdownButton<String>(
                  value: selectedRAM,
                  items: ramOptions.map((ram) {
                    return DropdownMenuItem(
                      value: ram,
                      child: Text('$ram GB'),
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
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: const Text('Pilih Penyimpanan (GB)'),
                trailing: DropdownButton<String>(
                  value: selectedStorage,
                  items: storageOptions.map((storage) {
                    return DropdownMenuItem(
                      value: storage,
                      child: Text('$storage GB'),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedStorage = value!;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: const Text('Harga Laptop'),
                trailing: SizedBox(
                  width: 100,
                  child: TextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Rp',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: const Text('Tier VGA'),
                trailing: DropdownButton<String>(
                  value: selectedVGATier,
                  items: vgaTierOptions.map((tier) {
                    return DropdownMenuItem(
                      value: tier,
                      child: Text('Tier $tier'),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedVGATier = value!;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: const Text('Tier Processor'),
                trailing: DropdownButton<String>(
                  value: selectedProcessorTier,
                  items: processorTierOptions.map((tier) {
                    return DropdownMenuItem(
                      value: tier,
                      child: Text('Tier $tier'),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedProcessorTier = value!;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: predictLaptopClass,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Lihat Hasil Prediksi'),
            ),
          ],
        ),
      ),
    );
  }
}
