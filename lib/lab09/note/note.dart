import 'package:project/lab09/db/note_dao.dart';
import 'package:project/lab09/note/edit.dart';
import 'package:project/lab09/note/create.dart';
import 'package:flutter/material.dart';

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  final NoteDAO noteDao = NoteDAO();
  List<Map<String, dynamic>> notes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getNotes();
  }

  void getNotes() async {
    final data = await noteDao.getNotes();
    setState(() {
      notes = data;
      isLoading = false;
    });
  }

  void deleteNote(int id) async {
    await noteDao.deleteNote(id);
    getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
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
                      MaterialPageRoute(builder: (context) => const CreateNote()),
                    ).then((value) => getNotes());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Create Note"),
                ),
              ),

              const SizedBox(height: 16),
              Text("Total Notes: ${notes.length}"),
              const SizedBox(height: 16),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : notes.isEmpty
                    ? const Center(child: Text("No Notes Found"))
                    : ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    final n = notes[index];

                    return Card(
                      child: ListTile(
                        title: Text(n['title']),
                        subtitle: Text(n['content']),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Edit(note: n),
                                  ),
                                ).then((value) => getNotes());
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => deleteNote(n['id']),
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
