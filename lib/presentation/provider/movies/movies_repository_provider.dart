import 'package:cinema_app/infraestructure/datasources/moviedb_datasource.dart';
import 'package:cinema_app/infraestructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Repositorio de solo lectura , su objetivo es poporcionar a los otros providers la info de este repo
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviesDbDatasource());
});
