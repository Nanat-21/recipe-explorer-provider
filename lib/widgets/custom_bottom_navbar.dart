import 'package:flutter/material.dart';

class CustomBottomNavbar
    extends StatelessWidget {

  final int currentIndex;

  final Function(int) onTap;

  const CustomBottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return NavigationBar(

      selectedIndex: currentIndex,

      onDestinationSelected: onTap,

      destinations: const [

        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Home',
        ),

        NavigationDestination(
          icon:
              Icon(Icons.favorite_border),
          selectedIcon:
              Icon(Icons.favorite),
          label: 'Favorites',
        ),

        NavigationDestination(
          icon: Icon(
            Icons.calendar_month_outlined,
          ),
          selectedIcon:
              Icon(Icons.calendar_month),
          label: 'Meal Plan',
        ),

        NavigationDestination(
          icon:
              Icon(Icons.settings_outlined),
          selectedIcon:
              Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}