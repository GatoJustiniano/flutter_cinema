import 'package:flutter_app_cinema/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movies_providers.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  final nowPlayMovies = ref.watch(nowPlayingMoviesProvider);

  if (nowPlayMovies.isEmpty) return [];
  return nowPlayMovies.sublist(0,6);
});
