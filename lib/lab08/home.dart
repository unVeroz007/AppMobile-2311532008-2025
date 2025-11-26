import 'package:project/lab08/create.dart';
import 'package:project/lab08/parsing.dart';
import 'package:project/lab08/update.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<dynamic>> fetchData() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/users'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['users'];
    } else {
      throw Exception('Gagal mengambil data');
    }
  }

Future<void> deletePost(int id) async {
  try {
    final response = await http.delete(
      Uri.parse('https://dummyjson.com/users/$id'),
    );
    
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
        msg: "Data berhasil dihapus!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    } else {
      throw Exception('Gagal menghapus data');
    }
  } catch (e) {
    Fluttertoast.showToast(
      msg: "Gagal menghapus data: $e",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Create()),
              );
            },
            child: const Text('Tambah Data'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Parsing()),
              );
            },
            child: const Text('Parsing Data'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: futurebuild(),
          ),
        ],
      ),
    );
  }

  FutureBuilder<List<dynamic>> futurebuild() {
    return FutureBuilder(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Image.network(snapshot.data![index]['image']),
                ),
                title: Text(snapshot.data![index]['firstName']),
                subtitle: Text(snapshot.data![index]['lastName']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Update(
                              id: snapshot.data![index]['id'],
                              firstName: snapshot.data![index]['firstName'],
                              lastName: snapshot.data![index]['lastName'],
                              age: snapshot.data![index]['age'],
                            ),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        deletePost(snapshot.data![index]['id']);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
