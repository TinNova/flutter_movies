import 'package:movies/app/sqlite.dart';
import 'package:movies/data/models/slq_movie.dart';
import 'package:sqflite/sqflite.dart';

import 'models/movie.dart';

class DatabaseRepo {
  static final table = 'movies';

  static final columnId = 'id';
  static final columnPosterPath = 'posterPath';

  Future<List<SqlMovie>> getAllFavMovies() async {
    final db = await getDatabase;
    final List<Map<String, dynamic>> maps = await db.query('movies');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return SqlMovie(id: maps[i]['id'], posterPath: maps[i]['posterPath']);
    });
  }

  Future<SqlMovie> getFavMovie(int movieId) async {
    final db = await getDatabase;

    List<Map> maps = await db.query(DatabaseRepo.table,
        columns: [DatabaseRepo.columnId, DatabaseRepo.columnPosterPath],
        where: '${DatabaseRepo.columnId} = ?',
        whereArgs: [movieId],
        limit: 1);

    // Convert the List<Map<String, dynamic> into a List<Movie>.
    SqlMovie sqlMovie = List.generate(maps.length, (i) {
      return SqlMovie(
        id: maps[i]['id'],
        posterPath: maps[i]['posterPath'],
      );
    }).first;

    return sqlMovie;
  }

  Future<void> insertFavMovie(Movie movie) async {
    final db = await getDatabase;
    await db.insert(
      'movies',
      movie.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteFavMovie(int id) async {
    final db = await getDatabase;
    await db.delete(
      'movies',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}
