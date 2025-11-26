import 'package:flutter/material.dart';

class ScrollHorizontal extends StatelessWidget {
  const ScrollHorizontal({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scroll H')),
      body: SizedBox(
        height: 120,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(10, (index) {
            return Container(
              width: 120,
              margin: const EdgeInsets.all(8),
              color: Colors.orange[100 * ((index % 8) + 1)],
              child: Center(child: Text('Item $index')),
            );
          }),
        ),
      ),
    );
  }
}
