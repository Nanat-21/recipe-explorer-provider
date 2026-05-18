import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/meal_plan_provider.dart';

class AddMealPlanScreen
    extends StatefulWidget {

  const AddMealPlanScreen({
    super.key,
  });

  @override
  State<AddMealPlanScreen>
      createState() =>
          _AddMealPlanScreenState();
}

class _AddMealPlanScreenState
    extends State<
        AddMealPlanScreen> {

  final mealController =
      TextEditingController();

  String selectedDay =
      'Monday';

  String selectedTime =
      'Breakfast';

  final days = [

    'Monday',

    'Tuesday',

    'Wednesday',

    'Thursday',

    'Friday',

    'Saturday',

    'Sunday',
  ];

  final mealTimes = [

    'Breakfast',

    'Lunch',

    'Dinner',

    'Dessert',
  ];

  IconData getMealIcon() {

    switch (selectedTime) {

      case 'Breakfast':
        return Icons
            .breakfast_dining;

      case 'Lunch':
        return Icons.lunch_dining;

      case 'Dinner':
        return Icons.dinner_dining;

      case 'Dessert':
        return Icons.cake;

      default:
        return Icons.restaurant;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xFFFFF8F2),

      appBar: AppBar(

        title: const Text(
          'Add Meal Plan',
        ),

        backgroundColor:
            Colors.orange,
      ),

      body: Padding(

        padding:
            const EdgeInsets.all(
          20,
        ),

        child: Column(
          children: [

            TextField(

              controller:
                  mealController,

              decoration:
                  InputDecoration(

                hintText:
                    'Enter meal name',

                filled: true,

                fillColor:
                    Colors.white,

                border:
                    OutlineInputBorder(

                  borderRadius:
                      BorderRadius.circular(
                    18,
                  ),

                  borderSide:
                      BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Container(

              padding:
                  const EdgeInsets.symmetric(
                horizontal: 15,
              ),

              decoration:
                  BoxDecoration(

                color: Colors.white,

                borderRadius:
                    BorderRadius.circular(
                  18,
                ),
              ),

              child: DropdownButton<String>(

                value: selectedDay,

                isExpanded: true,

                underline:
                    const SizedBox(),

                items: days.map((day) {

                  return DropdownMenuItem(

                    value: day,

                    child: Text(day),
                  );
                }).toList(),

                onChanged: (value) {

                  setState(() {

                    selectedDay =
                        value!;
                  });
                },
              ),
            ),

            const SizedBox(height: 20),

            Container(

              padding:
                  const EdgeInsets.symmetric(
                horizontal: 15,
              ),

              decoration:
                  BoxDecoration(

                color: Colors.white,

                borderRadius:
                    BorderRadius.circular(
                  18,
                ),
              ),

              child: DropdownButton<String>(

                value:
                    selectedTime,

                isExpanded: true,

                underline:
                    const SizedBox(),

                items:
                    mealTimes.map(
                  (time) {

                    return DropdownMenuItem(

                      value: time,

                      child:
                          Text(time),
                    );
                  },
                ).toList(),

                onChanged:
                    (value) {

                  setState(() {

                    selectedTime =
                        value!;
                  });
                },
              ),
            ),

            const SizedBox(height: 35),

            SizedBox(

              width:
                  double.infinity,

              height: 55,

              child:
                  ElevatedButton(

                style:
                    ElevatedButton
                        .styleFrom(

                  backgroundColor:
                      Colors.orange,

                  foregroundColor:
                      Colors.white,
                ),

                onPressed: () {

                  if (mealController
                      .text
                      .trim()
                      .isEmpty) {

                    return;
                  }

                  context
                      .read<
                          MealPlanProvider>()
                      .addMealPlan(

                    day:
                        selectedDay,

                    meal:
                        mealController
                            .text,

                    time:
                        selectedTime,

                    icon:
                        getMealIcon(),
                  );

                  Navigator.pop(
                    context,
                  );
                },

                child: const Text(

                  'Save Meal Plan',

                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}