import 'package:dio/dio.dart';
import 'package:flutter_app_cinema/config/constant/environment.dart';
import 'package:flutter_app_cinema/domain/datasources/movies_datasource.dart';
import 'package:flutter_app_cinema/domain/entities/movie.dart';
import 'package:flutter_app_cinema/infrastructure/mappers/movie_mapper.dart';
import 'package:flutter_app_cinema/infrastructure/models/moviedb/moviedb_response.dart';

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
    final respuesta = MovieDbResponse.fromJson(response.data);
    final List<Movie> listMovies = respuesta.results
        .where((element) => element.posterPath != 'no-poster')
        .map((item) => MovieMapper.movieDBToEntity(item))
        .toList();

    return listMovies;
  }
}
