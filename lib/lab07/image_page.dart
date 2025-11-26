import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Page')),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/Almet.jpg'),
            Image.network(
              'https://images.unsplash.com/photo-1511485977113-f34c92461ad9?ixlib=rb1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
            ),
            Image(image: AssetImage('assets/images/jaket-bca.jpg')),
          ],
        ),
      ),
    );
  }
}
