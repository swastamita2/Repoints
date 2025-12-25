import 'package:flutter/material.dart';

class RewardItem {
  final String id;
  final String title;
  final int cost;
  final String description;
  final IconData icon;
  final Color accent;
  final String? imagePath;
  int stock;
  bool isActive;

  RewardItem({
    String? id,
    required this.title,
    required this.cost,
    required this.description,
    required this.icon,
    required this.accent,
    this.imagePath,
    this.stock = 999,
    this.isActive = true,
  }) : id = id ?? 'reward-${DateTime.now().millisecondsSinceEpoch}';

  RewardItem copyWith({
    String? title,
    int? cost,
    String? description,
    IconData? icon,
    Color? accent,
    String? imagePath,
    int? stock,
    bool? isActive,
  }) {
    return RewardItem(
      id: id,
      title: title ?? this.title,
      cost: cost ?? this.cost,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      accent: accent ?? this.accent,
      imagePath: imagePath ?? this.imagePath,
      stock: stock ?? this.stock,
      isActive: isActive ?? this.isActive,
    );
  }
}
