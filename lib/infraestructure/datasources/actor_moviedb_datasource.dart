import 'package:cinema_app/domain/datasources/actors_datasource.dart';
import 'package:dio/dio.dart';

import '../../config/constants/environment.dart';
import '../../domain/entities/actor.dart';
import '../mappers/actor_mapper.dart';
import '../models/moviedb/credits_response.dart';

class ActorMovieDbDatasource extends ActorsDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDbKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final castResponse = CastResponse.fromJson(response.data);

    List<Actor> actors =
        castResponse.cast.map((cast) => ActorMapper.castToEnity(cast)).toList();

    return actors;
  }
}
