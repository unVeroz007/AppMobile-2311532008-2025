import 'package:project/lab09/db/db_helper.dart';

class TodoDAO {
  static const tableSql = """
    CREATE TABLE todos(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      content TEXT,
      date TEXT
    )
  """;

  final dbHelper = DBHelper();

  Future<List<Map<String, dynamic>>> getTodos() async {
    final db = await dbHelper.database;
    return await db.query('todos');
  }

  Future<int> insertTodo(Map<String, dynamic> data) async {
    final db = await dbHelper.database;
    return await db.insert('todos', data);
  }

  Future<int> updateTodo(int id, Map<String, dynamic> data) async {
    final db = await dbHelper.database;
    return await db.update('todos', data, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteTodo(int id) async {
    final db = await dbHelper.database;
    return await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }
}
