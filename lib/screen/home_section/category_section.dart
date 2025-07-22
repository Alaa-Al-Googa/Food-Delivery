import 'package:flutter/material.dart';
import 'package:gazaburger/models/category.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  int selectedIndex = 0;

  final List<CategoryModel> categories = [
    CategoryModel(emoji: "🍔", name: "Burger"),
    CategoryModel(emoji: "🌮", name: "Taco"),
    CategoryModel(emoji: "🥤", name: "Drink"),
    CategoryModel(emoji: "🍕", name: "Pizza"),
    CategoryModel(emoji: "🥤", name: "Drink"),
    CategoryModel(emoji: "🍕", name: "Pizza"),
    CategoryModel(emoji: "🥤", name: "Drink"),
    CategoryModel(emoji: "🍕", name: "Pizza"),
    CategoryModel(emoji: "🥤", name: "Drink"),
    CategoryModel(emoji: "🍕", name: "Pizza"),
  ];

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
          SizedBox(
            height: 80,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = index == selectedIndex;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: isSelected ? Color(0xffFE8C00) : Colors.grey[100],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          category.emoji,
                          style: const TextStyle(fontSize: 24),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          category.name,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
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
