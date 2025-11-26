import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  // Menggunakan gambar 'flutter.png' yang Anda punya
  final List<String> imageList = const [
    'assets/images/Almet.jpg',
    'assets/images/jaket-bca.jpg',
    'assets/images/press-release-hmif-coklat.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeri Sederhana'),
        // Terapkan font Open Sans Condensed
        titleTextStyle: TextStyle(
          fontFamily: 'Noto Sans Condensed',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(4.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 kolom
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return Image.asset(imageList[index], fit: BoxFit.cover);
        },
      ),
    );
  }
}
