import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String icon;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.icon,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'Salad',
        icon: 'assets/icons/plate.svg',
        boxColor: const Color(0xff92a3fd),
      ),
    );
    categories.add(
      CategoryModel(
        name: 'Cake',
        icon: 'assets/icons/pancakes.svg',
        boxColor: const Color(0xffc58bf2),
      ),
    );
    categories.add(
      CategoryModel(
        name: 'Pie',
        icon: 'assets/icons/pie.svg',
        boxColor: const Color(0xff92a3fd),
      ),
    );
    categories.add(
      CategoryModel(
        name: 'Smoothies',
        icon: 'assets/icons/orange-snacks.svg',
        boxColor: const Color(0xffc58bf2),
      ),
    );

    return categories;
  }
}
