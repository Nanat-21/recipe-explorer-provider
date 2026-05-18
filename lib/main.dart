import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'providers/meal_provider.dart';
import 'providers/meal_plan_provider.dart';

import 'screens/home_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/meal_plan_screen.dart';
import 'screens/settings_screen.dart';

import 'widgets/custom_bottom_navbar.dart';

void main() {

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() =>
      _MyAppState();
}

class _MyAppState
    extends State<MyApp> {

  int currentIndex = 0;

  final List<Widget> pages = [

    const HomeScreen(),

    const FavoritesScreen(),

    const MealPlanScreen(),

    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return MultiProvider(

      providers: [

        ChangeNotifierProvider(

          create: (_) =>
              MealProvider(),
        ),

        ChangeNotifierProvider(

          create: (_) =>
              MealPlanProvider(),
        ),
      ],

      child: MaterialApp(

        debugShowCheckedModeBanner:
            false,

        theme: ThemeData(

          useMaterial3: true,

          scaffoldBackgroundColor:
              const Color(
            0xFFFFF8F2,
          ),

          colorScheme:
              ColorScheme.fromSeed(

            seedColor:
                Colors.orange,
          ),

          appBarTheme:
              const AppBarTheme(

            centerTitle: false,

            backgroundColor:
                Colors.transparent,

            elevation: 0,
          ),
        ),

        home: Scaffold(

          body: IndexedStack(

            index: currentIndex,

            children: pages,
          ),

          bottomNavigationBar:
              CustomBottomNavbar(

            currentIndex:
                currentIndex,

            onTap: (index) {

              setState(() {

                currentIndex =
                    index;
              });
            },
          ),
        ),
      ),
    );
  }
}