import 'dart:convert';
import 'dart:io';

import 'package:dojoapp/data/dtos/upcoming_movies_dto.dart';
import 'package:dojoapp/strings/strings.dart';
import 'package:http/http.dart' as http;

class ApiService {
  const ApiService();

  static const String _authToken =
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YTY1ZjQ0YjIzYWQ0MDU0NmRhODlhNjgxZDA3NGUzMSIsInN1YiI6IjY0ZmIyOTcxYWY1OGNiMGE2MmU4M2NlZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.laM3iXSCw-7DQbeVAx6nimMtHj3RfTq-XtmSiQoMcPI';
  static const baseUrl = 'https://api.themoviedb.org/3/';
  static const errorMessage = ' error fetching data';

  Future<UpcomingMoviesDto> getUpcomingMovies({required int page}) async {
    try {
      var response = await http.get(
        Uri.parse(
          '$baseUrl${Strings.movie}${Strings.slash}${Strings.upcoming}?page=$page',
        ),
        headers: {HttpHeaders.authorizationHeader: _authToken},
      );
      if (response.statusCode == HttpStatus.ok) {
        return UpcomingMoviesDto.fromJson(jsonDecode(response.body));
      }
      throw Exception('${response.statusCode}');
    } catch (e) {
      throw Exception(e);
    }
  }
}
