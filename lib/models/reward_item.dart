import 'package:flutter/material.dart';

class RewardItem {
  final String title;
  final int cost;
  final String description;
  final IconData icon;
  final Color accent;
  final String? imagePath;

  const RewardItem({
    required this.title,
    required this.cost,
    required this.description,
    required this.icon,
    required this.accent,
    this.imagePath,
  });
}
