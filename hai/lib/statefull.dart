import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyNetworkImage());
}

class MyNetworkImage extends StatelessWidget {
  const MyNetworkImage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Network & Asset Image")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Menampilkan gambar dari assets
              Image.asset(
                'assets/images/logo.png',
                width: 100,
                height: 150,
              ),

              const SizedBox(height: 20),

              // Menampilkan SVG dari internet
              SvgPicture.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Logo_Unand.svg/600px-Logo_Unand.svg.png",
                width: 100,
                height: 150,
                placeholderBuilder: (context) =>
                    const CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
