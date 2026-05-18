import 'package:flutter/material.dart';

import '../widgets/custom_bottom_navbar.dart';

import 'home_screen.dart';
import 'favorites_screen.dart';
import 'meal_plan_screen.dart';
import 'settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() =>
      _MainScreenState();
}

class _MainScreenState
    extends State<MainScreen> {

  int currentIndex = 0;

  final List<Widget> pages = [

    const HomeScreen(),

    const FavoritesScreen(),

    const MealPlanScreen(),

    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: pages[currentIndex],

      bottomNavigationBar:
          CustomBottomNavbar(

        currentIndex: currentIndex,

        onTap: (index) {

          setState(() {

            currentIndex = index;
          });
        },
      ),
    );
  }
}