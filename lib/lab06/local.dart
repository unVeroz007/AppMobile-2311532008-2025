import 'package:flutter/material.dart';

// ParentWidget adalah StatefulWidget
class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  int _counter = 0;

  // Fungsi untuk mengupdate state
  void _updateCounter(int newValue) {
    setState(() {
      _counter = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Permasalahan State Lokal")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nilai Counter: $_counter',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            // Mengirim state dan callback ke ChildWidget
            ChildWidget(
              counter: _counter,
              onUpdate: _updateCounter, // passing callback ke anak
            ),
          ],
        ),
      ),
    );
  }
}

// ChildWidget adalah StatelessWidget
class ChildWidget extends StatelessWidget {
  final int counter;
  final Function(int) onUpdate;

  const ChildWidget({required this.counter, required this.onUpdate, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // Memanggil callback saat ditekan
      onPressed: () => onUpdate(counter + 1),
      child: const Text('Tambah (+1)'),
    );
  }
}
