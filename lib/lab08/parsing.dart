import 'package:project/lab08/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Parsing extends StatefulWidget {
  const Parsing({super.key});

  @override
  State<Parsing> createState() => _ParsingState();
}

class _ParsingState extends State<Parsing> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/users'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['users'];
      setState(() {
        users = data.map((post) => User.fromJson(post)).toList();
      });
    } else {
      throw Exception('Gagal mengambil data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Parsing')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Image.network(users[index].image),
                  ),
                  title: Text(users[index].firstName),
                  subtitle: Text(users[index].lastName),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
