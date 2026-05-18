import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/meal_model.dart';
import '../providers/meal_provider.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() =>
      _AddMealScreenState();
}

class _AddMealScreenState
    extends State<AddMealScreen> {

  final TextEditingController
      titleController =
      TextEditingController();

  final TextEditingController
      categoryController =
      TextEditingController();

  final TextEditingController
      imageController =
      TextEditingController();

  final TextEditingController
      descriptionController =
      TextEditingController();

  final TextEditingController
      stepsController =
      TextEditingController();

  @override
  void dispose() {

    titleController.dispose();

    categoryController.dispose();

    imageController.dispose();

    descriptionController.dispose();

    stepsController.dispose();

    super.dispose();
  }

  void saveMeal() {

    if (titleController.text.isEmpty ||
        categoryController.text.isEmpty ||
        imageController.text.isEmpty ||
        descriptionController
            .text.isEmpty) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(
          content:
              Text('Please fill all fields'),
        ),
      );

      return;
    }

    final meal = Meal(

      id: DateTime.now()
          .millisecondsSinceEpoch,

      title: titleController.text,

      description:
          descriptionController.text,

      imageUrl:
          imageController.text,

      category:
          categoryController.text,

      steps: stepsController.text
              .isEmpty
          ? []
          : stepsController.text
              .split(','),
    );

    context
        .read<MealProvider>()
        .addMeal(meal);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xFFFFF8F2),

      appBar: AppBar(
        title:
            const Text('Add Recipe'),
      ),

      body: SingleChildScrollView(

        padding:
            const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller:
                  titleController,

              decoration:
                  const InputDecoration(
                labelText:
                    'Recipe Title',
                border:
                    OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller:
                  categoryController,

              decoration:
                  const InputDecoration(
                labelText:
                    'Category',
                hintText:
                    'Breakfast / Lunch / Dinner / Dessert',
                border:
                    OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller:
                  imageController,

              decoration:
                  const InputDecoration(
                labelText:
                    'Image URL',
                border:
                    OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller:
                  descriptionController,

              maxLines: 4,

              decoration:
                  const InputDecoration(
                labelText:
                    'Description',
                border:
                    OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller:
                  stepsController,

              maxLines: 4,

              decoration:
                  const InputDecoration(
                labelText:
                    'Cooking Steps',
                hintText:
                    'Separate each step with commas',
                border:
                    OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(

                style:
                    ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.orange,

                  foregroundColor:
                      Colors.white,
                ),

                onPressed: saveMeal,

                child: const Text(
                  'Save Recipe',
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