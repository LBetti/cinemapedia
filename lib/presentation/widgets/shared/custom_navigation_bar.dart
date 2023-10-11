import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(elevation: 0, items: const [
      BottomNavigationBarItem(label: 'Inicio', icon: Icon(Icons.home_max)),
      BottomNavigationBarItem(
          label: 'Categorias', icon: Icon(Icons.label_outline)),
      BottomNavigationBarItem(
          label: 'Favoritos', icon: Icon(Icons.favorite_outline)),
    ]);
  }
}
