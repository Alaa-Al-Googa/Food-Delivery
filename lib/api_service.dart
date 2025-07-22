import 'dart:convert';
import 'package:gazaburger/models/category.dart';
import 'package:gazaburger/models/meal.dart';
import 'package:gazaburger/models/mealDetail.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<CategoryModel>> fetchCategories() async {
    final response = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> categoriesJson = data['categories'];
      return categoriesJson
          .map((json) => CategoryModel.fromJson(json))
          .toList();
    } else {
      throw Exception('فشل في جلب التصنيفات');
    }
  }

  static Future<List<MealModel>> fetchMealsByCategory(String category) async {
    final url =
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=$category';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final mealsJson = data['meals'] as List;
      return mealsJson.map((json) => MealModel.fromJson(json)).toList();
    } else {
      throw Exception('فشل في جلب الوجبات');
    }
  }

  static Future<MealDetailModel> fetchMealDetails(String id) async {
    final url = 'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final mealJson = data['meals'][0];
      return MealDetailModel.fromJson(mealJson);
    } else {
      throw Exception('فشل في جلب تفاصيل الوجبة');
    }
  }
}
