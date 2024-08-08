import 'package:flutter/material.dart';
import 'package:flutter_app_cinema/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayMovies = ref.watch(nowPlayingMoviesProvider);
    if (nowPlayMovies.isEmpty) return const CircularProgressIndicator();
    return ListView.builder(
      itemCount: nowPlayMovies.length,
      itemBuilder: (context, index) {
        final movie = nowPlayMovies[index];
        return ListTile(
          title: Text(movie.title),
        );
      },
    );
  }
}