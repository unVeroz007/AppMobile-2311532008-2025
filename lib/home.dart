import 'package:flutter/material.dart';
import 'local.dart';
import 'provider/first.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Praktikum 6: State Management')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tombol 1: Local State
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ParentWidget()),
                );
              },
              child: const Text("Local State"),
            ),
            const SizedBox(height: 20),

            // Tombol 2: Global State (Counter)
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FirstPage()),
                );
              },
              child: const Text("Global State (Provider)"),
            ),

            // Tombol 3: Halaman Setting
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
              child: const Text("Halaman Setting (Tugas)"),
            ),
          ],
        ),
      ),
    );
  }
}
