import 'package:flutter/material.dart';

class CategoriesModel {
  final String label;
  final String image;
  final Color color;
  final String endPoint;

  CategoriesModel(
      {required this.endPoint,  required this.label, required this.image, required this.color});
}
