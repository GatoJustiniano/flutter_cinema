import 'package:dio/dio.dart';
import 'package:flutter_app_cinema/config/constant/environment.dart';
import 'package:flutter_app_cinema/domain/datasources/movies_datasource.dart';
import 'package:flutter_app_cinema/domain/entities/movie.dart';
import 'package:flutter_app_cinema/infrastructure/mappers/movie_mapper.dart';
import 'package:flutter_app_cinema/infrastructure/models/moviedb/movie_details.dart';
import 'package:flutter_app_cinema/infrastructure/models/moviedb/moviedb_response.dart';

class MovieDBDataSource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDBKey,
        'language': 'es-MX'
      },
    ),
  );

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final respuesta = MovieDbResponse.fromJson(json);
    final List<Movie> listMovies = respuesta.results
        .where((element) => element.posterPath != 'no-poster')
        .map((item) => MovieMapper.movieDBToEntity(item))
        .toList();

    return listMovies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }

  @override
  Future<Movie> getMovieByID(String id) async {
    final response = await dio.get('/movie/$id');
    if (response.statusCode != 200) throw Exception('Movie with id: $id not found');

    final movieDetails = MovieDetails.fromJson(response.data);
    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);
    return movie;
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    if (query.isEmpty) return [];

    final response =
        await dio.get('/search/movie', queryParameters: {'query': query, 'include_adult': true});

    return _jsonToMovies(response.data);
  }
}
