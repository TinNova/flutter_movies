class SqlMovie {
  final int id;
  final String posterPath;

  SqlMovie({
    required this.id,
    required this.posterPath,
  });

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Movie{id: $id, posterPath: $posterPath}';
  }
}
