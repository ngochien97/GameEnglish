import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

//db name
final dbName = 'MeeyTeam.db';

//table name
final TABLE_CASES = 'table_cases';

final DateColumn = 'Date';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _createDatabase();
    return _database!;
  }

  Future<Database> _createDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, dbName);
    var database = await openDatabase(path,
        version: 6, onCreate: initDB, onUpgrade: onUpgrade);
    return database;
  }

  Future<void> onUpgrade(
      Database database, int oldVersion, int newVersion) async {
    try {
      if (newVersion > oldVersion) {}
    } catch (e) {
      print('--------$e');
    }
  }

  void initDB(Database database, int version) async {
    await database
        .execute("CREATE TABLE $TABLE_CASES ($DateColumn TEXT PRIMARY KEY)");
  }
}
