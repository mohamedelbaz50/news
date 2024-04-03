import 'package:flutter/material.dart';
import 'package:news_app/models/categories_model.dart';
import 'package:news_app/pages/news_by_category_page.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.model,
    required this.index,
  });
  final CategoriesModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsByCategoryPage(
                      category: model.endPoint,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: model.color.withOpacity(0.9),
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomLeft: index % 2 != 0
                    ? const Radius.circular(20)
                    : const Radius.circular(0),
                bottomRight: index % 2 == 0
                    ? const Radius.circular(20)
                    : const Radius.circular(0))),
        child: Column(
          children: [
            Expanded(child: Image.asset(model.image)),
            Text(
              model.label,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
