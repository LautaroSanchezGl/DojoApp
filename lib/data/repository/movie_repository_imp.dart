import 'package:dojoapp/data/datasource/remote/api_service.dart';
import 'package:dojoapp/data/mapper/movie_mapper.dart';
import 'package:dojoapp/domain/entities/movie.dart';
import 'package:dojoapp/domain/repository/movie_repository_interface.dart';

class MovieRepositoryImp implements IMovieRepository {
  final ApiService apiService;

  const MovieRepositoryImp(this.apiService);

  @override
  Future<List<Movie>> getUpcomingMovies({required int page}) async {
    try {
      final upcomingMoviesDto = await apiService.getUpcomingMovies(page: page);
      final movies =
          upcomingMoviesDto.results.map((dto) => dto.toEntity()).toList();

      return movies;
    } catch (e) {
      rethrow;
    }
  }
}
