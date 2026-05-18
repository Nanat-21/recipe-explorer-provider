import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/meal_plan_provider.dart';

import 'add_meal_plan_screen.dart';

class MealPlanScreen
    extends StatelessWidget {

  const MealPlanScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final provider =
        context.watch<
            MealPlanProvider>();

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
                  const AddMealPlanScreen(),
            ),
          );
        },
      ),

      appBar: AppBar(

        elevation: 0,

        backgroundColor:
            Colors.transparent,

        title: const Text(

          'Meal Planner',

          style: TextStyle(
            fontWeight:
                FontWeight.bold,
          ),
        ),
      ),

      body: Padding(

        padding:
            const EdgeInsets.all(
          20,
        ),

        child:
            provider.mealPlans.isEmpty

                ? const Center(

                    child: Text(

                      'No meal plans yet.\nTap + to add one.',

                      textAlign:
                          TextAlign.center,

                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  )

                : ListView.builder(

                    itemCount:
                        provider
                            .mealPlans
                            .length,

                    itemBuilder:
                        (context,
                            index) {

                      final plan =
                          provider
                                  .mealPlans[
                              index];

                      return Container(

                        margin:
                            const EdgeInsets.only(
                          bottom: 18,
                        ),

                        padding:
                            const EdgeInsets.all(
                          18,
                        ),

                        decoration:
                            BoxDecoration(

                          color:
                              Colors.white,

                          borderRadius:
                              BorderRadius.circular(
                            22,
                          ),
                        ),

                        child: Row(
                          children: [

                            Container(

                              height: 60,
                              width: 60,

                              decoration:
                                  BoxDecoration(

                                color: Colors
                                    .orange
                                    .shade100,

                                borderRadius:
                                    BorderRadius.circular(
                                  18,
                                ),
                              ),

                              child: Icon(

                                plan['icon']
                                    as IconData,

                                color:
                                    Colors.orange,

                                size: 32,
                              ),
                            ),

                            const SizedBox(
                                width:
                                    18),

                            Expanded(

                              child:
                                  Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,

                                children: [

                                  Text(

                                    plan['meal']
                                        as String,

                                    style:
                                        const TextStyle(

                                      fontSize:
                                          20,

                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(
                                      height:
                                          6),

                                  Text(

                                    '${plan['day']} • ${plan['time']}',

                                    style:
                                        const TextStyle(
                                      color:
                                          Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            IconButton(

                              icon:
                                  const Icon(
                                Icons.delete,
                                color:
                                    Colors.red,
                              ),

                              onPressed:
                                  () {

                                provider
                                    .deleteMealPlan(
                                  index,
                                );
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}