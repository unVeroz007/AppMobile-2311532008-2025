import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/counter.dart'; // Path relatif
import 'second.dart'; // Path relatif

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendengarkan perubahan state
    final counter = context.watch<CounterModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Halaman 1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Nilai Counter Saat Ini:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '${counter.count}',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: counter.decrement,
                  child: const Text('-'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: counter.increment,
                  child: const Text('+'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage()),
              ),
              child: const Text('Lihat di Halaman 2'),
            ),
          ],
        ),
      ),
    );
  }
}
