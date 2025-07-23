import 'package:flutter/material.dart';
import 'package:gazaburger/api_service.dart';
import 'package:gazaburger/models/meal.dart';
import 'package:gazaburger/screen/details_screen.dart';
import 'package:gazaburger/shimmer.dart';

class FoodListSection extends StatefulWidget {
  final String category;

  const FoodListSection({super.key, required this.category});

  @override
  State<FoodListSection> createState() => _FoodListSectionState();
}

class _FoodListSectionState extends State<FoodListSection> {
  List<MealModel> meals = [];

  @override
  void initState() {
    super.initState();
    fetchMeals();
  }

  @override
  void didUpdateWidget(covariant FoodListSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.category != widget.category) {
      fetchMeals();
    }
  }

  Future<void> fetchMeals() async {
    try {
      final data = await ApiService.fetchMealsByCategory(widget.category);
      setState(() {
        meals = data;
      });
    } catch (e) {
      print('خطأ: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return meals.isEmpty
        ? ShimmerGrid()
        : GridView.builder(
            padding: const EdgeInsets.all(12),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: meals.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.69,
            ),
            itemBuilder: (context, index) {
              final item = meals[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailsScreen(id: item.id);
                      },
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15),
                            ),
                            child: Image.network(
                              item.thumbnail,
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Container(
                                      height: 120,
                                      width: double.infinity,
                                      color: Colors.grey[300],
                                      child: const Center(
                                        child: CircularProgressIndicator(
                                          color: Color(0xffFE8C00),
                                        ),
                                      ),
                                    );
                                  },
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 120,
                                  width: double.infinity,
                                  color: Colors.grey[300],
                                  child: const Icon(
                                    Icons.broken_image,
                                    color: Colors.grey,
                                    size: 40,
                                  ),
                                );
                              },
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          item.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Color(0xffFE8C00),
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            Text('4.9'),
                            Spacer(),
                            Icon(
                              Icons.location_on,
                              color: Color(0xffFE8C00),
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            Text('190m'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '\$17,230',
                          style: TextStyle(
                            color: Color(0xffFE8C00),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
