class CategoryModel {
  final String name;
  final String imageUrl;

  CategoryModel({required this.name, required this.imageUrl});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['strCategory'],
      imageUrl: json['strCategoryThumb'],
    );
  }
}
