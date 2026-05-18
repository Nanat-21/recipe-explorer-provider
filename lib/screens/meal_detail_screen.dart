import 'package:flutter/material.dart';

import '../models/meal_model.dart';

class MealDetailScreen
    extends StatelessWidget {

  final Meal meal;

  const MealDetailScreen({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xFFFFF8F2),

      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Stack(
              children: [

                Image.network(

                  meal.imageUrl,

                  height: 320,

                  width: double.infinity,

                  fit: BoxFit.cover,

                  errorBuilder:
                      (
                    context,
                    error,
                    stackTrace,
                  ) {

                    return Container(

                      height: 320,

                      color:
                          Colors.grey.shade300,

                      child: const Center(

                        child: Icon(
                          Icons
                              .image_not_supported,
                          size: 60,
                        ),
                      ),
                    );
                  },
                ),

                Positioned(

                  top: 50,
                  left: 20,

                  child: CircleAvatar(

                    backgroundColor:
                        Colors.white,

                    child: IconButton(

                      icon: const Icon(
                        Icons.arrow_back,
                      ),

                      onPressed: () {

                        Navigator.pop(
                          context,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),

            Padding(

              padding:
                  const EdgeInsets.all(
                24,
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                children: [

                  Text(

                    meal.title,

                    style:
                        const TextStyle(

                      fontSize: 32,

                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Container(

                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),

                    decoration: BoxDecoration(

                      color:
                          Colors.orange.shade100,

                      borderRadius:
                          BorderRadius.circular(
                        20,
                      ),
                    ),

                    child: Text(

                      meal.category,

                      style: TextStyle(
                        color:
                            Colors.orange.shade900,

                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text(

                    'Description',

                    style: TextStyle(
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(

                    meal.description,

                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(

                    'Cooking Steps',

                    style: TextStyle(
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  ListView.builder(

                    shrinkWrap: true,

                    physics:
                        const NeverScrollableScrollPhysics(),

                    itemCount:
                        meal.steps.length,

                    itemBuilder:
                        (context, index) {

                      return Container(

                        margin:
                            const EdgeInsets.only(
                          bottom: 16,
                        ),

                        padding:
                            const EdgeInsets.all(
                          18,
                        ),

                        decoration:
                            BoxDecoration(

                          color: Colors.white,

                          borderRadius:
                              BorderRadius.circular(
                            20,
                          ),
                        ),

                        child: Row(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                          children: [

                            CircleAvatar(

                              backgroundColor:
                                  Colors.orange,

                              child: Text(

                                '${index + 1}',

                                style:
                                    const TextStyle(
                                  color:
                                      Colors.white,
                                ),
                              ),
                            ),

                            const SizedBox(
                                width: 16),

                            Expanded(

                              child: Text(

                                meal.steps[
                                    index],

                                style:
                                    const TextStyle(
                                  fontSize:
                                      16,

                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}