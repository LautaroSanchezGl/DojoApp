import 'package:dojoapp/data/dtos/movie_dto.dart';

class UpcomingMoviesDto {
  final int page;
  final List<MovieDto> results;
  final int totalPages;
  final int totalResults;

  UpcomingMoviesDto({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory UpcomingMoviesDto.fromJson(Map<String, dynamic> json) =>
      UpcomingMoviesDto(
        page: json["page"],
        results: List<MovieDto>.from(
          json["results"].map((x) => MovieDto.fromJson(x)),
        ),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
