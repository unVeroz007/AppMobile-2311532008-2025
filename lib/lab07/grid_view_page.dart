import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GridView')),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(12, (index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: Center(child: Text('Item \$index')),
          );
        }),
      ),
    );
  }
}
