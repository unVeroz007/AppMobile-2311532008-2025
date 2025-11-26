import 'package:flutter/material.dart';

class LoadingErrorPage extends StatelessWidget {
  const LoadingErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loading Error Page')), // [cite: 342]
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              // Simulasi proses loading 2 detik [cite: 348]
              future: Future.delayed(
                Duration(seconds: 2),
                () => 'Selesai',
              ), // [cite: 348]
              builder: (context, snapshot) {
                // Saat sedang loading [cite: 350]
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // [cite: 352]
                }
                // Jika ada error [cite: 353]
                if (snapshot.hasError) {
                  return Text('Terjadi error'); // [cite: 354]
                }
                // Jika sukses [cite: 356]
                return Text(snapshot.data.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
