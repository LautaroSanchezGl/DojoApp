import 'package:floor/floor.dart';

import '../../../../domain/entities/movie.dart';

@dao
abstract class MovieDao {
  @Query('SELECT * FROM Movie')
  Future<List<Movie>> getMovies();
}
