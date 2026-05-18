class Meal {

  final int? id;

  final String title;

  final String description;

  final String imageUrl;

  // SINGLE CATEGORY
  final String category;

  final List<String> steps;

  Meal({
    this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.steps,
  });

  factory Meal.fromJson(
      Map<String, dynamic> json) {

    return Meal(

      id: int.tryParse(
        json['idMeal']?.toString() ??
            json['id']?.toString() ??
            '',
      ),

      title:
          json['strMeal'] ??
              json['title'] ??
              'New Recipe',

      description:
          json['strInstructions'] ??
              json['body'] ??
              'No instructions.',

      imageUrl:
          json['strMealThumb'] ??
              json['image'] ??
              '',

      category:
          json['strCategory'] ??
              json['category'] ??
              'General',

      steps:
          json['steps'] != null
              ? List<String>.from(
                  json['steps'],
                )
              : [],
    );
  }

  Map<String, dynamic> toJson() {

    return {

      'id': id,

      'title': title,

      'body': description,

      'image': imageUrl,

      'category': category,

      'steps': steps,
    };
  }
}