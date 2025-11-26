import 'package:flutter/material.dart';

class SingleScroll extends StatelessWidget {
  const SingleScroll({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Single Scroll')),
      body: SingleChildScrollView(
        child: Column(children: List.generate(50, (i) => Text('Data ke-\$i'))),
      ),
    );
  }
}
