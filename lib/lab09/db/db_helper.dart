import 'package:project/lab09/db/note_dao.dart';
import 'package:project/lab09/db/todo_dao.dart';
import 'package:project/lab09/db/user_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  // Get the database instance
  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  // Initialize the database
  Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(NoteDAO.tableSql);
        await db.execute(UserDAO.tableSql);
        await db.execute(TodoDAO.tableSql);
      },
    );
  }

  // Reset the entire database (drops all tables and recreates them)
  Future<void> resetAppDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app.db'); // ganti sesuai nama db kamu
    await deleteDatabase(path);

    _db = null;
    //reinit db
    _db = await initDB();
  }
}