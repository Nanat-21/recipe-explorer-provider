import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/meal_provider.dart';

import '../widgets/category_chip.dart';
import '../widgets/featured_banner.dart';
import '../widgets/meal_card.dart';
import '../widgets/search_bar_widget.dart';

import 'add_meal_screen.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {

  final List<String> categories = [

    'All',

    'Breakfast',

    'Lunch',

    'Dinner',

    'Dessert',
  ];

  String selectedCategory = 'All';

  @override
  void initState() {

    super.initState();

    Future.microtask(() {

      context
          .read<MealProvider>()
          .getRecipes();
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider =
        context.watch<MealProvider>();

    return Scaffold(

      backgroundColor:
          const Color(0xFFFFF8F2),

      floatingActionButton:
          FloatingActionButton(

        backgroundColor:
            Colors.orange,

        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),

        onPressed: () {

          Navigator.push(

            context,

            MaterialPageRoute(

              builder: (_) =>
                  const AddMealScreen(),
            ),
          );
        },
      ),

      body: SafeArea(

        child: provider.isLoading

            ? const Center(
                child:
                    CircularProgressIndicator(),
              )

            : SingleChildScrollView(

                padding:
                    const EdgeInsets.all(
                  20,
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,

                  children: [

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,

                      children: [

                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                          children: const [

                            Text(
                              'Hello 👋',

                              style: TextStyle(
                                fontSize: 18,
                                color:
                                    Colors.grey,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              'Find Your Recipe',

                              style: TextStyle(
                                fontSize: 30,
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),
                          ],
                        ),

                        CircleAvatar(
                          radius: 26,
                          backgroundColor:
                              Colors.orange
                                  .shade100,

                          child: const Icon(
                            Icons.restaurant,
                            color:
                                Colors.orange,
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 28),

                    SearchBarWidget(
                      onChanged: (value) {

                        provider.searchMeals(
                          value,
                        );
                      },
                    ),

                    const SizedBox(height: 28),

                    const FeaturedBanner(),

                    const SizedBox(height: 35),

                    const Text(

                      'Categories',

                      style: TextStyle(
                        fontSize: 24,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 18),

                    SizedBox(

                      height: 52,

                      child: ListView.builder(

                        scrollDirection:
                            Axis.horizontal,

                        itemCount:
                            categories.length,

                        itemBuilder:
                            (ctx, i) {

                          final category =
                              categories[i];

                          return CategoryChip(

                            title: category,

                            isSelected:
                                selectedCategory ==
                                    category,

                            onTap: () {

                              setState(() {

                                selectedCategory =
                                    category;
                              });

                              provider
                                  .filterByCategory(
                                category,
                              );
                            },
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 35),

                    const Text(

                      'Popular Recipes',

                      style: TextStyle(
                        fontSize: 24,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    provider.meals.isEmpty

                        ? const Center(

                            child: Padding(

                              padding:
                                  EdgeInsets.all(
                                40,
                              ),

                              child: Text(
                                'No recipes found',
                              ),
                            ),
                          )

                        : ListView.builder(

                            shrinkWrap: true,

                            physics:
                                const NeverScrollableScrollPhysics(),

                            itemCount:
                                provider.meals.length,

                            itemBuilder:
                                (ctx, i) {

                              return MealCard(
                                meal:
                                    provider
                                        .meals[i],
                              );
                            },
                          ),

                    const SizedBox(height: 120),
                  ],
                ),
              ),
      ),
    );
  }
}
