import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theMovieDBKey =
      dotenv.env['THE_MOVIEDB_KEY'] ?? 'No hay API, configure con soporte';
  static String titleApp =
      dotenv.env['TITLE_APP'] ?? 'La Super Garrita';
}
