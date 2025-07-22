class MealDetailModel {
  final String name;
  final String image;
  final String instructions;

  MealDetailModel({
    required this.name,
    required this.image,
    required this.instructions,
  });

  factory MealDetailModel.fromJson(Map<String, dynamic> json) {
    return MealDetailModel(
      name: json['strMeal'],
      image: json['strMealThumb'],
      instructions: json['strInstructions'],
    );
  }
}
