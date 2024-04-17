import 'package:dojoapp/data/dtos/movie_dto.dart';

import '../../domain/entities/movie.dart';
import '../../strings/strings.dart';

extension MovieMapper on MovieDto {
  Movie toEntity() {
    return Movie(
      adult: adult,
      backdropPath: backdropPath.isEmpty
          ? Strings.noPosterPath
          : '${Strings.imageBaseUrl}$backdropPath',
      genres: genreIds,
      id: id,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath.isEmpty
          ? Strings.noPosterPath
          : '${Strings.imageBaseUrl}$posterPath',
      releaseDate: releaseDate,
      title: title,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
