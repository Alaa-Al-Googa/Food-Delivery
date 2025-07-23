import 'package:flutter/material.dart';
import 'package:gazaburger/api_service.dart';
import 'package:gazaburger/models/category.dart';
import 'package:gazaburger/shimmer.dart';

class CategorySection extends StatefulWidget {
  final Function(String) onCategoryTap;

  const CategorySection({super.key, required this.onCategoryTap});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  List<CategoryModel> categories = [];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final data = await ApiService.fetchCategories();
      setState(() {
        categories = data;
      });
    } catch (e) {
      print('خطأ: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Find by Category',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text('See All', style: TextStyle(color: Color(0xffFE8C00))),
            ],
          ),
          const SizedBox(height: 12),
          categories.isEmpty
              ? ShimmerCategory()
              : SizedBox(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      final isSelected = index == selectedIndex;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            widget.onCategoryTap(category.name);
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 100,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Color(0xffFE8C00)
                                : Colors.grey[100],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                category.imageUrl,
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Container(
                                        //height: 120,
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
                              const SizedBox(height: 8),
                              Text(
                                category.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
