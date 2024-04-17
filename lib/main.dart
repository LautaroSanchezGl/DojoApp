import 'package:dojoapp/presentation/bloc/movies_bloc.dart';
import 'package:dojoapp/presentation/screens/upcoming_movies_screen.dart';
import 'package:flutter/material.dart';

import 'data/datasource/remote/api_service.dart';
import 'data/repository/movie_repository_imp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final MoviesBloc moviesBloc =
      MoviesBloc(movieRepository: const MovieRepositoryImp(ApiService()));

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dojo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: UpcomingMoviesScreen(
        title: 'Upcoming Movies',
        moviesBloc: moviesBloc,
      ),
    );
  }
}
