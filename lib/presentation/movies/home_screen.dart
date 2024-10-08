import 'package:flutter/material.dart';
import 'package:flutter_app_cinema/presentation/providers/providers.dart';
import 'package:flutter_app_cinema/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
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
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) {
      return const FullScreenLoader();
    }

    final nowPlayMovies = ref.watch(nowPlayingMoviesProvider);
    final moviesSlideShow = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    if (nowPlayMovies.isEmpty) return const CircularProgressIndicator();
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppBar(),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
              children: [
                MoviesSlideshow(movies: moviesSlideShow),
                MovieHorizontalListview(
                  movies: nowPlayMovies,
                  title: 'En cines',
                  subTitle: 'Lunes a Viernes',
                  loadNextPage: () => ref
                      .read(nowPlayingMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                MovieHorizontalListview(
                  movies: popularMovies,
                  title: 'Populares',
                  subTitle: '',
                  loadNextPage: () => ref
                      .read(popularMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                MovieHorizontalListview(
                  movies: topRatedMovies,
                  title: 'Mejor calificados',
                  subTitle: '',
                  loadNextPage: () => ref
                      .read(topRatedMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                MovieHorizontalListview(
                  movies: upcomingMovies,
                  title: 'Próximos',
                  subTitle: '',
                  loadNextPage: () => ref
                      .read(upcomingMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                const SizedBox(height: 15),
              ],
            );
          },
          childCount: 1,
        )),
      ],
    );
  }
}
