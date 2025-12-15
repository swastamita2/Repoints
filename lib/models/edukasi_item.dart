import 'package:flutter/material.dart';

enum EdukasiCategory { daurUlang, lingkungan, tips, inovasi, komunitas }

class EdukasiItem {
  final String id;
  final String title;
  final String description;
  final String fullContent;
  final IconData icon;
  final String imagePath;
  final EdukasiCategory category;
  final int readMinutes;
  final DateTime publishDate;
  final List<String> tags;
  bool isFavorite;
  bool isRead;

  EdukasiItem({
    required this.id,
    required this.title,
    required this.description,
    required this.fullContent,
    required this.icon,
    required this.imagePath,
    required this.category,
    required this.readMinutes,
    required this.publishDate,
    this.tags = const [],
    this.isFavorite = false,
    this.isRead = false,
  });

  String get categoryName {
    switch (category) {
      case EdukasiCategory.daurUlang:
        return 'Daur Ulang';
      case EdukasiCategory.lingkungan:
        return 'Lingkungan';
      case EdukasiCategory.tips:
        return 'Tips & Trik';
      case EdukasiCategory.inovasi:
        return 'Inovasi';
      case EdukasiCategory.komunitas:
        return 'Komunitas';
    }
  }

  Color get categoryColor {
    switch (category) {
      case EdukasiCategory.daurUlang:
        return const Color(0xFF4CAF50);
      case EdukasiCategory.lingkungan:
        return const Color(0xFF2196F3);
      case EdukasiCategory.tips:
        return const Color(0xFFFF9800);
      case EdukasiCategory.inovasi:
        return const Color(0xFF9C27B0);
      case EdukasiCategory.komunitas:
        return const Color(0xFFE91E63);
    }
  }
}
