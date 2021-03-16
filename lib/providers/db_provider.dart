import 'package:sqflite/sqflite.dart';

class DbProvider {
  static Database _database;
  static final DbProvider db = DbProvider._();

  DbProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDb();

    return _database;
  }

  Future<Database> initDb() async {}
}
