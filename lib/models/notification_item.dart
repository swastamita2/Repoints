import 'package:flutter/material.dart';

enum NotificationType { deposit, redemption }

class NotificationItem {
  final String id;
  final String title;
  final String subtitle;
  final DateTime date;
  final NotificationType type;
  final String? imageAsset;
  final bool isRead;

  const NotificationItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.type,
    this.imageAsset,
    this.isRead = false,
  });

  IconData get icon {
    switch (type) {
      case NotificationType.deposit:
        return Icons.check_circle;
      case NotificationType.redemption:
        return Icons.card_giftcard;
    }
  }

  Color get iconColor {
    switch (type) {
      case NotificationType.deposit:
        return const Color(0xFF4CAF50);
      case NotificationType.redemption:
        return const Color(0xFF4CAF50);
    }
  }
}
