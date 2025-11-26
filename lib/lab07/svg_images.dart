import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgImage extends StatelessWidget {
  const SvgImage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SVG Image')),
      body: Center(
        child: Column(
          children: [
            SvgPicture.asset('assets/images/image.svg'),
            SvgPicture.network(
              'https://images.unsplash.com/photo-1511485977113-f34c92461ad9?ixlib=rb1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
            ),
          ],
        ),
      ),
    );
  }
}
