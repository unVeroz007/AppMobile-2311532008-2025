import 'package:project/lab09/db/note_dao.dart';
import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  const Edit({super.key, required this.note});
  final Map<String, dynamic> note;

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.note['title'];
    _contentController.text = widget.note['content'];
  }

  void _submit() async {
    final title = _titleController.text;
    final content = _contentController.text;

    final dao = NoteDAO();
    await dao.updateNote(widget.note['id'], {
      'title': title,
      'content': content,
    });

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Note')),
      body: Padding(
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
                child: const Text("Update"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
