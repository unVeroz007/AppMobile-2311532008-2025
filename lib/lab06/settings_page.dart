import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/theme_model.dart'; 

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 'watch' untuk mengambil nilai tema saat ini
    final themeModel = context.watch<ThemeModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Gunakan SwitchListTile agar lebih rapi
            SwitchListTile(
              title: const Text('Dark Mode'),
              secondary: const Icon(Icons.dark_mode),
              // Nilai switch diambil dari provider
              value: themeModel.themeMode == ThemeMode.dark,
              // Saat switch di-toggle, panggil fungsi di provider
              onChanged: (bool value) {
                // 'read' digunakan untuk memanggil fungsi
                context.read<ThemeModel>().toggleTheme(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
