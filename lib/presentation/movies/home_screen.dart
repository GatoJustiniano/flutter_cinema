import 'package:flutter/material.dart';
import 'package:flutter_app_cinema/config/constant/environment.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('La key es $Environment.theMovieDBKey'),
      ),
    );
  }
}
