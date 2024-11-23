import 'package:flutter/material.dart';
import 'package:flutter_app_cinema/presentation/views/views.dart';
import 'package:flutter_app_cinema/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home-screen';
  final int pageIndex;

  const HomeScreen({super.key, required this.pageIndex});

  final viewRoutes = const <Widget>[
    HomeView(),
    SizedBox(), // <--- categorias View
    FavoritesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(currentIndex: pageIndex),
    );
  }
}
