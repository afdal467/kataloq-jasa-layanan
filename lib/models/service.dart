import 'package:flutter/material.dart';

class Service {
  const Service({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.description,
    required this.provider,
    required this.icon,
    required this.color,
  });
  final String id;
  final String name;
  final String category;
  final String price;
  final double rating;
  final int reviewCount;
  final String description;
  final String provider;
  final IconData icon;
  final Color color;
}
