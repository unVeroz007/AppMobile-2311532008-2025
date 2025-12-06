import 'package:project/lab10/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App()); // Menjalankan aplikasi Flutter
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hilangkan banner debug
      title: 'Praktikum 10',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(), // Mulai dengan Splash Screen
    );
  }
}