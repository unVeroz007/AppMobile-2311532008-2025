import 'package:flutter/material.dart';

class ContactListPage extends StatelessWidget {
  const ContactListPage({super.key});

  // Simulasi data kontak
  final List<Map<String, String>> contacts = const [
    {
      "name": "Muhammad Galid Avero",
      "phone": "+62 8876543210",
      "avatar": "A"
    },
    {"name": "Azim", "phone": "+62 81948784732", "avatar": "S"},
    {"name": "Adam", "phone": "+62 80987654323", "avatar": "B"},
    {"name": "ahda", "phone": "+62 88383838389", "avatar": "C"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Kontak'),
        // Terapkan font Open Sans Condensed
        titleTextStyle: TextStyle(
          fontFamily: 'Noto Sans Condensed',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          
          return ListTile(
            leading: CircleAvatar(
              child: Text(contact['avatar']!),
            ),
            title: Text(contact['name']!),
            subtitle: Text(contact['phone']!),
            trailing: Icon(Icons.call),
            onTap: () {
              print('Memanggil ${contact['name']}');
            },
          );
        },
      ),
    );
  }
}