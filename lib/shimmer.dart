import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerGrid extends StatefulWidget {
  const ShimmerGrid({super.key});

  @override
  State<ShimmerGrid> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ShimmerGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 6, // عدد العناصر الوهمية
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.69,
      ),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 16, width: 100, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Container(height: 16, width: 16, color: Colors.white),
                      SizedBox(width: 4),
                      Container(height: 14, width: 30, color: Colors.white),
                      Spacer(),
                      Container(height: 16, width: 16, color: Colors.white),
                      SizedBox(width: 4),
                      Container(height: 14, width: 40, color: Colors.white),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 16, width: 80, color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ShimmerCategory extends StatefulWidget {
  const ShimmerCategory({super.key});

  @override
  State<ShimmerCategory> createState() => _ShimmerGrState();
}

class _ShimmerGrState extends State<ShimmerCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 6, // عدد العناصر الوهمية
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: 100,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(height: 12, width: 60, color: Colors.white),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
