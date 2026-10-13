import 'package:flutter/material.dart';

class ServiceModel {
  final String name;
  final String category;
  final String price;
  final String description;
  final IconData icon;

  ServiceModel({
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.icon,
  });
}
