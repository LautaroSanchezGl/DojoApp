import 'dart:async';

import 'package:dojoapp/domain/repository/movie_repository_interface.dart';

import '../../domain/entities/movie.dart';

class MoviesBloc {
  final IMovieRepository movieRepository;
  final _movies = StreamController<List<Movie>>.broadcast();
  Stream<List<Movie>> get movies => _movies.stream;
  static int _actualPage = 1;
  final _localMovies = <Movie>[];

  MoviesBloc({required this.movieRepository});

  Future<void> getUpcomingMovies({page = 1}) async {
    final movies = await movieRepository.getUpcomingMovies(page: page);
    _localMovies.addAll(movies);
    _movies.sink.add(_localMovies);
  }

  Future<void> loadNextPage() async {
    getUpcomingMovies(page: ++_actualPage);
  }

  void dispose() {
    _movies.close();
  }
}
