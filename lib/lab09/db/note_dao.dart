import 'package:project/lab09/db/db_helper.dart';

class NoteDAO {
  static const tableSql = '''
    CREATE TABLE notes(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      content TEXT
    )
  ''';

  final dbHelper = DBHelper();

  Future<List<Map<String, dynamic>>> getNotes() async {
    final db = await dbHelper.database;
    return await db.query('notes');
  }

  Future<int> insertNote(Map<String, dynamic> data) async {
    final db = await dbHelper.database;
    return await db.insert('notes', data);
  }

  Future<int> updateNote(int id, Map<String, dynamic> data) async {
    final db = await dbHelper.database;
    return await db.update('notes', data, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteNote(int id) async {
    final db = await dbHelper.database;
    return await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }
}
