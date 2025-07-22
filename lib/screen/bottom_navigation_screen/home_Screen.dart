import 'package:flutter/material.dart';
import 'package:gazaburger/screen/home_section/category_section.dart';
import 'package:gazaburger/screen/home_section/food_list_section.dart';
import 'package:gazaburger/screen/home_section/header_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [HeaderSection(), CategorySection(), FoodListSection()],
        ),
      ),
    );
  }
}
