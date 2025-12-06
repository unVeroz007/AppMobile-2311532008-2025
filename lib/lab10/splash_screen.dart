import 'package:project/lab10/local_storage/local_storage.dart';
import 'package:project/lab10/auth/login.dart';
import 'package:project/lab10/main_navigation.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token; // Variabel untuk menyimpan token

  @override
  void initState() {
    super.initState();
    checkToken(); // Cek token saat widget diinisialisasi
  }

  void checkToken() async {
    final token = await LocalStorage.getToken(); // Ambil token dari local storage

    // Tunda 3 detik untuk efek splash screen
    Future.delayed(Duration(seconds: 3), () {
      if (!mounted) return; // Pastikan widget masih ada

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => token != null ? MainNavigation() : Login(),
        ),
      );
    });
  }

// Ganti kode bagian build:
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Optional: tambah background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Anda
            Image.asset(
              'assets/images/logo.png',
              height: 150,
              width: 150,
            ),
            SizedBox(height: 20), // Spasi
            // Optional: Tambahkan loading indicator
            CircularProgressIndicator(
              color: Colors.white,
            ),
            // Optional: Tambahkan teks
            SizedBox(height: 20),
            Text(
              'Loading...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}