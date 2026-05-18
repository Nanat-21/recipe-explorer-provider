import 'package:flutter/material.dart';

import 'favorites_screen.dart';
import 'home_screen.dart';

class SettingsScreen
    extends StatefulWidget {

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() =>
      _SettingsScreenState();
}

class _SettingsScreenState
    extends State<SettingsScreen> {

  bool notifications = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xFFFFF8F2),

      appBar: AppBar(

        elevation: 0,

        backgroundColor:
            Colors.transparent,

        title: const Text(

          'Settings',

          style: TextStyle(
            fontWeight:
                FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(

        padding:
            const EdgeInsets.all(20),

        child: Column(
          children: [

            Container(

              padding:
                  const EdgeInsets.all(
                24,
              ),

              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius:
                    BorderRadius.circular(
                  28,
                ),
              ),

              child: const Column(
                children: [

                  CircleAvatar(

                    radius: 42,

                    backgroundColor:
                        Colors.orange,

                    child: Icon(
                      Icons.restaurant_menu,
                      size: 45,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 16),

                  Text(

                    'Recipe Explorer',

                    style: TextStyle(
                      fontSize: 24,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 6),

                  Text(
                    'Explore authentic Ethiopian recipes',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 30),

            buildTile(

              context: context,

              icon:
                  Icons.favorite_outline,

              title: 'Favorites',

              page:
                  const FavoritesScreen(),
            ),

            buildTile(

              context: context,

              icon: Icons.history,

              title:
                  'Recent Recipes',

              page: const HomeScreen(),
            ),

            buildTile(

              context: context,

              icon:
                  Icons.help_outline,

              title:
                  'Help & Support',

              page: Scaffold(

                appBar: AppBar(
                  title:
                      const Text(
                    'Help & Support',
                  ),
                ),

                body: const Padding(

                  padding:
                      EdgeInsets.all(
                    20,
                  ),

                  child: Text(

                    'Recipe Explorer helps users discover authentic Ethiopian recipes and organize weekly meal plans.',
                    
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            Container(

              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius:
                    BorderRadius.circular(
                  20,
                ),
              ),

              child: SwitchListTile(

                value: notifications,

                activeColor:
                    Colors.orange,

                secondary:
                    const Icon(
                  Icons.notifications,
                ),

                title: const Text(
                  'Notifications',
                ),

                onChanged:
                    (value) {

                  setState(() {

                    notifications =
                        value;
                  });
                },
              ),
            ),

            const SizedBox(height: 35),

            const Text(

              'Recipe Explorer v1.0',

              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTile({

    required BuildContext context,

    required IconData icon,

    required String title,

    required Widget page,
  }) {

    return Container(

      margin:
          const EdgeInsets.only(
        bottom: 15,
      ),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
            BorderRadius.circular(
          20,
        ),
      ),

      child: ListTile(

        onTap: () {

          Navigator.push(

            context,

            MaterialPageRoute(

              builder: (_) => page,
            ),
          );
        },

        leading: Icon(
          icon,
          color: Colors.orange,
        ),

        title: Text(title),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
      ),
    );
  }
}