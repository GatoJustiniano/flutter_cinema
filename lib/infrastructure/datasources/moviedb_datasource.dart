import 'package:dio/dio.dart';
import 'package:flutter_app_cinema/config/constant/environment.dart';
import 'package:flutter_app_cinema/domain/datasources/movies_datasource.dart';
import 'package:flutter_app_cinema/domain/entities/movie.dart';

class MovieDBDataSource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      queryParameters: {
        'api_key': Environment.theMovieDBKey,
        'language': 'es-MX'
      },
    ),
  );
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('movie/now_playing');
    final List<Movie> list_Movies = [];

    return [];
  }
}
