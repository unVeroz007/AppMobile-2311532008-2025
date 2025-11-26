import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class Update extends StatefulWidget {
  const Update({
    super.key,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
  });

  final int id;
  final String firstName;
  final String lastName;
  final int age;

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _firstNameController.text = widget.firstName;
    _lastNameController.text = widget.lastName;
    _ageController.text = widget.age.toString();
  }

  Future<void> updatePost(int id) async {
    try {
      final response = await http.put(
        Uri.parse('https://dummyjson.com/users/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'id': id,
          'firstName': _firstNameController.text,
          'lastName': _lastNameController.text,
          'age': int.parse(_ageController.text),
        }),
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Data berhasil diubah!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      } else {
        throw Exception('Gagal update data');
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Gagal mengubah data: $e",
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
      appBar: AppBar(title: const Text('Update')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              TextField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              TextField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Umur',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () => updatePost(widget.id),
                child: const Text('Kirim Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
