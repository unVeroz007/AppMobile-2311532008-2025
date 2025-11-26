import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});
  @override
  Widget build(BuildContext context) {
    final items = List.generate(20, (i) => 'Item \$i');
    return Scaffold(
      appBar: AppBar(title: Text('ListView')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(items[index]), leading: Icon(Icons.list));
        },
      ),
    );
  }
}
