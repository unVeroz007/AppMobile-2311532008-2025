import 'package:flutter/material.dart';

class ListTilePage extends StatelessWidget {
  const ListTilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListTile')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Person 1'),
            subtitle: Text('Subtitle 1'),
            trailing: Icon(Icons.chat),
            onTap: () {
              print('Chat dengan John Doe');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Person 2'),
            subtitle: Text('Subtitle 2'),
            trailing: Icon(Icons.chat),
            onTap: () {
              print('Chat dengan John Doe');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Person 3'),
            subtitle: Text(
              'Subtitle 3',
              style: TextStyle(
                fontFamily: 'Noto Sans Condensed',
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),

            trailing: Icon(Icons.chat),
            onTap: () {
              print('Chat dengan John Doe');
            },
          ),
        ],
      ),
    );
  }
}
