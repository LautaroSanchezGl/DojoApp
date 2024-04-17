import 'package:dojoapp/presentation/bloc/movies_bloc.dart';
import 'package:dojoapp/presentation/widgets/movie_card.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/movie.dart';

class UpcomingMoviesScreen extends StatefulWidget {
  const UpcomingMoviesScreen(
      {super.key, required this.title, required this.moviesBloc});

  final String title;
  final MoviesBloc moviesBloc;

  @override
  State<UpcomingMoviesScreen> createState() => _UpcomingMoviesScreenState();
}

class _UpcomingMoviesScreenState extends State<UpcomingMoviesScreen> {
  final scrolController = ScrollController();

  @override
  void initState() {
    super.initState();
    widget.moviesBloc.getUpcomingMovies();
    scrolController.addListener(() {
      if (scrolController.position.pixels + 200 >
          scrolController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  void loadNextPage() {
    widget.moviesBloc.loadNextPage();
  }

  @override
  void dispose() {
    widget.moviesBloc.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant UpcomingMoviesScreen oldWidget) {
    widget.moviesBloc.getUpcomingMovies();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          StreamBuilder<List<Movie>>(
            initialData: const [],
            stream: widget.moviesBloc.movies,
            builder:
                (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                final movies = snapshot.data!;
                return SizedBox(
                  height: 350,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView.builder(
                          controller: scrolController,
                          scrollDirection: Axis.horizontal,
                          itemCount: movies.length,
                          itemBuilder: (context, index) {
                            return MovieCard(
                              movie: movies[index],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return const Text('error');
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
