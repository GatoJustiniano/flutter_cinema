import 'package:flutter_app_cinema/infrastructure/datasources/moviedb_datasource.dart';
import 'package:flutter_app_cinema/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// repository inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MovieDBDataSource());
});
