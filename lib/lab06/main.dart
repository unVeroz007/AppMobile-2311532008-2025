// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'model/counter.dart'; // Import model
// import 'home.dart'; // Import halaman home

// void main() {
//   runApp(
//     // Mendaftarkan CounterModel sebagai provider
//     ChangeNotifierProvider(
//       create: (context) => CounterModel(),
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Praktikum 6',
//       theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
//       home: const HomePage(), // Mulai dari HomePage
//     );
//   }
// }

// Ganti seluruh isi lib/main.dart dengan ini

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/counter.dart'; 
import 'model/theme_model.dart'; 
import 'home.dart';

void main() {
  runApp(
    // Gunakan MultiProvider untuk mendaftarkan semua provider
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterModel()),
        ChangeNotifierProvider(
          create: (context) => ThemeModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 'watch' akan membuat MyApp build ulang saat tema berubah
    final themeModel = context.watch<ThemeModel>();

    return MaterialApp(
      title: 'Praktikum 6',
      // Definisikan tema light dan dark
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Tema dark
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      // Gunakan state dari ThemeModel untuk menentukan tema
      themeMode: themeModel.themeMode,
      home: const HomePage(),
    );
  }
}
