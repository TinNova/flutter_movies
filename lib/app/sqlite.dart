import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

late final Future<Database> _database;

void setupSQLite() async {
  WidgetsFlutterBinding.ensureInitialized();
  _database = openDatabase(
    join(await getDatabasesPath(), 'movie_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE movies(id INTEGER PRIMARY KEY, posterPath TEXT)',
      );
    },
    version: 1,
  );
}

Future<Database> get getDatabase => _database;

