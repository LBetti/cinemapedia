import 'package:cinema_app/domain/entities/movie.dart';
import 'package:cinema_app/presentation/delegates/search_movie_delegate.dart';
import 'package:cinema_app/presentation/provider/movies/movies_repository_provider.dart';
import 'package:cinema_app/presentation/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                const Icon(
                  Icons.movie_outlined,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Cinemapedia',
                  style: TextStyle(color: Colors.black),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      final searchedMovies = ref.read(searchedMoviesProvider);
                      final searchQuery = ref.read(searchQueryProvider);

                      showSearch<Movie?>(
                              query: searchQuery,
                              context: context,
                              delegate: SearchMovieDelegate(
                                  initialMovies: searchedMovies,
                                  searchMovies: ref
                                      .read(searchedMoviesProvider.notifier)
                                      .searchMoviesByQuery))
                          .then((movie) {
                        if (movie == null) return;
                        context.push('/movie/${movie.id}');
                      });
                    },
                    icon: const Icon(Icons.search)),
              ],
            ),
          ),
        ));
  }
}
