import 'package:cinema_app/domain/entities/actor.dart';
import 'package:cinema_app/infraestructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEnity(Cast cast) => Actor(
        id: cast.id,
        name: cast.name,
        profilePath: cast.profilePath != null
            ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
            : 'https://static.displate.com/857x1200/displate/2022-04-15/7422bfe15b3ea7b5933dffd896e9c7f9_46003a1b7353dc7b5a02949bd074432a.jpg',
        character: cast.character,
      );
}
