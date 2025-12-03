import 'package:project/lab09/db/db_helper.dart';

class UserDAO {
  static const tableSql = """
    CREATE TABLE users(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      firstname TEXT,
      lastname TEXT,
      username TEXT,
      password TEXT
    )
  """;

  final dbHelper = DBHelper();

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await dbHelper.database;
    return await db.query('users');
  }

  Future<int> insertUser(Map<String, dynamic> data) async {
    final db = await dbHelper.database;
    return await db.insert('users', data);
  }

  Future<int> updateUser(int id, Map<String, dynamic> data) async {
    final db = await dbHelper.database;
    return await db.update('users', data, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteUser(int id) async {
    final db = await dbHelper.database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }
}