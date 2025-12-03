import 'package:project/lab09/db/user_dao.dart';
import 'package:project/lab09/user/create.dart';
import 'package:project/lab09/user/edit.dart';
import 'package:flutter/material.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  final UserDAO userDao = UserDAO();
  List<Map<String, dynamic>> users = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  void getUsers() async {
    final users = await userDao.getUsers();
    setState(() {
      this.users = users;
      isLoading = false;
    });
  }

  void deleteUser(int id) async {
    await userDao.deleteUser(id);
    setState(() => isLoading = true);
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateUser(),
                      ),
                    ).then((value) => getUsers());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Create User'),
                ),
              ),
              const SizedBox(height: 16),
              Text('Total Users: ${users.length}'),
              const SizedBox(height: 16),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : users.isEmpty
                    ? const Center(child: Text('No users found'))
                    : ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                            '${users[index]['firstname']} ${users[index]['lastname']}'),
                        subtitle: Text(users[index]['username']),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditUser(user: users[index]),
                                  ),
                                ).then((value) => getUsers());
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                deleteUser(users[index]['id']);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}