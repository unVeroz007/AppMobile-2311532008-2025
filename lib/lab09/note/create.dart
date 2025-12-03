import 'package:project/lab09/db/note_dao.dart';
import 'package:flutter/material.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  final NoteDAO noteDao = NoteDAO();

  void _submit() async {
    final title = _titleController.text;
    final content = _contentController.text;

    await noteDao.insertNote({'title': title, 'content': content});

    _titleController.clear();
    _contentController.clear();

    if (!mounted) return;
    Navigator.pop(context); // kembali ke note.dart
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Note')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Title",
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: _contentController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Content",
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submit,
                  child: const Text("Create"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
