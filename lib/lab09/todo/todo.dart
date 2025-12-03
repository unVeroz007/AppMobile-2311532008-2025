import 'package:project/lab09/db/todo_dao.dart';
import 'package:project/lab09/todo/create.dart';
import 'package:project/lab09/todo/edit.dart';
import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final TodoDAO todoDao = TodoDAO();
  List<Map<String, dynamic>> todos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getTodos();
  }

  void getTodos() async {
    final todos = await todoDao.getTodos();
    setState(() {
      this.todos = todos;
      isLoading = false;
    });
  }

  void deleteTodo(int id) async {
    await todoDao.deleteTodo(id);
    setState(() => isLoading = true);
    getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todos')),
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
                        builder: (context) => const CreateTodo(),
                      ),
                    ).then((value) => getTodos());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Create Todo'),
                ),
              ),
              const SizedBox(height: 16),
              Text('Total Todos: ${todos.length}'),
              const SizedBox(height: 16),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : todos.isEmpty
                    ? const Center(child: Text('No todos found'))
                    : ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(todos[index]['title']),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(todos[index]['content']),
                            Text('Date: ${todos[index]['date']}'),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditTodo(todo: todos[index]),
                                  ),
                                ).then((value) {
                                  if (value == true) { // Jika kembali dengan nilai true
                                    getTodos(); // Refresh data
                                  }
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                deleteTodo(todos[index]['id']);
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