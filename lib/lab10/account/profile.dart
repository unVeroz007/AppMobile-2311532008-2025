import 'dart:convert';
import 'package:project/lab10/local_storage/local_storage.dart';
import 'package:project/lab10/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Map<String, dynamic>? _profileData;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    String? token = await LocalStorage.getToken();
    if (token == null || token.isEmpty) return;

    final response = await http.get(
      Uri.parse('https://dummyjson.com/auth/me'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      setState(() {
        _profileData = jsonDecode(response.body);
      });
    } else {
      print('Failed to fetch profile: ${response.statusCode}');
    }
  }

  void _logout() {
    LocalStorage.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Logged out successfully')),
    );
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: _logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: _profileData == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(_profileData!['image'] ?? ''),
              onBackgroundImageError: (exception, stackTrace) {
                // Handle error
              },
            ),
            const SizedBox(height: 16),
            Text(
              '${_profileData!['firstName']} ${_profileData!['lastName']}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              _profileData!['email'] ?? '',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: const Text('Phone'),
                    trailing: Text(_profileData!['phone'] ?? 'N/A'),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Gender'),
                    trailing: Text(_profileData!['gender'] ?? 'N/A'),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.cake),
                    title: const Text('Birth Date'),
                    trailing: Text(_profileData!['birthDate'] ?? 'N/A'),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: const Text('Address'),
                    subtitle: _profileData!['address'] != null
                        ? Text(
                      '${_profileData!['address']['address'] ?? ''}, ${_profileData!['address']['city'] ?? ''}, ${_profileData!['address']['state'] ?? ''}, ${_profileData!['address']['postalCode'] ?? ''}',
                    )
                        : const Text('N/A'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _logout,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  icon: const Icon(Icons.logout),
                  label: const Text('Logout', style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}