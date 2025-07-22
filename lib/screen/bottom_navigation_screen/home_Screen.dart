import 'package:flutter/material.dart';
import 'package:gazaburger/screen/home_section/category_section.dart';
import 'package:gazaburger/screen/home_section/food_list_section.dart';
import 'package:gazaburger/screen/home_section/header_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'Beef';
  void onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderSection(),
            CategorySection(onCategoryTap: onCategorySelected),
            FoodListSection(category: selectedCategory),
          ],
        ),
      ),
    );
  }
}
