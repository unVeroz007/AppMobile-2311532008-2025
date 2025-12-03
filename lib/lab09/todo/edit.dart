import 'package:project/lab09/db/todo_dao.dart';
import 'package:flutter/material.dart';

class EditTodo extends StatefulWidget {
  const EditTodo({super.key, required this.todo});

  final Map<String, dynamic> todo;

  @override
  State<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.todo['title'];
    _contentController.text = widget.todo['content'];
    _dateController.text = widget.todo['date'];
  }

  void _submit() async { // Tambahkan async di sini
    final title = _titleController.text;
    final content = _contentController.text;
    final date = _dateController.text;

    final todoDao = TodoDAO();
    await todoDao.updateTodo(widget.todo['id'], { // Tambahkan await di sini
      'title': title,
      'content': content,
      'date': date,
    });

    if (!mounted) return;
    Navigator.pop(context, true); // Mengembalikan nilai true untuk refresh
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Todo')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _contentController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Content',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _dateController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Date (YYYY-MM-DD)',
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Update'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}