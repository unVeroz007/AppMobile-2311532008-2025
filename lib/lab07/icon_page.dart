import 'package:flutter/material.dart';

class IconPage extends StatelessWidget {
  const IconPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Icon Page')),
      body: Center(
        child: Column(
          children: [
            Icon(Icons.person, size: 50),
            Icon(Icons.chat, size: 50),
            Icon(Icons.phone, size: 50),
            Icon(Icons.email, size: 50),
          ],
        ),
      ),
    );
  }
}
