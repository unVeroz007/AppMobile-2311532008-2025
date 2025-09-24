import 'package:flutter/material.dart';

void main() {
  runApp(const MyNetworkImage());
}

class MyNetworkImage extends StatelessWidget {
  const MyNetworkImage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Network SVG Image")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/LogoUnand.png',
                width: 100,
                height: 150,
              ),
              Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Logo_Unand.svg/600px-Logo_Unand.svg.png",
                width: 120,
                height: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
