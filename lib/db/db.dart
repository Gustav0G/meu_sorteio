import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Db {
  Db._();
  static final Db instance = Db._();
  static Database? _database;

  get database async {
    if (_database != null) {
      return _database;
    } else {
      return await _initDatabase();
    }
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'history2.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(Database db, version) async {
    await db.execute(_sqlScript);
  }

  String get _sqlScript => ''' 
  CREATE TABLE history2(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    qtdNumbers INTEGER,
    minValue INTEGER,
    maxValue INTEGER,
    numberResult TEXT
  )
  ''';
}
