import 'package:cinema_app/presentation/views/views.dart';
import 'package:flutter/material.dart';

import '../../widgets/shared/custom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  final int pageIndex;
  static const name = 'home-screen';
  const HomeScreen({super.key, required this.pageIndex});

  final viewRoutes = const <Widget>[HomeView(), SizedBox(), FavoritesView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomNavBar(currentIndex: pageIndex),
    );
  }
}
