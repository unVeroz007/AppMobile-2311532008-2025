import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/counter.dart'; // Path relatif

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman 2')),
      body: Center(
        // 'Consumer' diletakkan di dalam child milik Center
        child: Consumer<CounterModel>(
          // Ini adalah builder yang benar
          builder: (context, counter, child) {
            // 'Column' ada di dalam builder
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // 'children' berisi semua widget tampilan
              children: [
                const Text(
                  'Counter yang sama ditampilkan di halaman ini:',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '${counter.count}',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: counter.reset,
                  child: const Text('Reset Counter'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Kembali ke Halaman 1'),
                ),
              ],
            );
          }, // Penutup untuk builder
        ), // Penutup untuk Consumer
      ), // Penutup untuk Center
    ); // Penutup untuk Scaffold
  }
}
