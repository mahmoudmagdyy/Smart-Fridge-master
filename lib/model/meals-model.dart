class Meals {
  Meals({
    this.title,
    this.description,
    this.image,
    this.calories,
    this.carbo,
    this.protein,
    this.ingredients,
    this.directions,
    this.details
  });

  String? title;
  String? description;
  String? image;
  int? calories;
  int? carbo;
  int? protein;
  String? ingredients;
  String? directions;
  String? details;

  factory Meals.fromMap(Map<String, dynamic> json) => Meals(
    title: json["title"],
    description: json["description"],
    image: json["image"],
    calories: json["calories"],
    carbo: json["carbo"],
    protein: json["protein"],
    ingredients: json["ingredients"],
    directions: json["directions"],
    details: json["details"],
  );
}