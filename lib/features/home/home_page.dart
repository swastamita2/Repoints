import 'package:flutter/material.dart';

import '../../models/edukasi_item.dart';
import '../../models/history_entry.dart';
import '../../models/notification_item.dart';
import '../../widgets/action_square.dart';
import '../../widgets/history_tile.dart';
import '../notification/notification_page.dart';

class HomePage extends StatelessWidget {
  final String userName;
  final int userPoints;
  final double monthlyKg;
  final double targetKg;
  final String levelLabel;
  final List<HistoryEntry> history;
  final List<EdukasiItem> edukasiItems;
  final List<NotificationItem> notifications;
  final VoidCallback onSetorTap;
  final VoidCallback onRewardTap;
  final Function(int) onDeleteNotification;

  const HomePage({
    super.key,
    required this.userName,
    required this.userPoints,
    required this.monthlyKg,
    required this.targetKg,
    required this.levelLabel,
    required this.history,
    required this.edukasiItems,
    required this.notifications,
    required this.onSetorTap,
    required this.onRewardTap,
    required this.onDeleteNotification,
  });

  @override
  Widget build(BuildContext context) {
    final recentHistory = history.take(4).toList();
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 16),
          _buildHeroCard(),
          const SizedBox(height: 16),
          _buildActionSquares(),
          const SizedBox(height: 16),
          _buildTipsCarousel(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Aktivitas Terkini',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                'Lihat Semau >',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...recentHistory.map((entry) => HistoryTile(entry: entry)),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    // Extract first name from full name
    final firstName = userName.split(' ').first;

    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white24,
          child: Text(
            userName.isNotEmpty ? userName[0].toUpperCase() : 'U',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo, $firstName!',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              levelLabel,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.15),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NotificationPage(
                    notifications: notifications,
                    onDelete: onDeleteNotification,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHeroCard() {
    return RepaintBoundary(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF1B5E20), Color(0xFF4CAF50)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 18,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '🏆 Poin Kamu',
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '$userPoints Poin',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Level: $levelLabel ⭐',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Target Bulan Ini',
                        style: TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${monthlyKg.toStringAsFixed(1)} kg / ${targetKg.toStringAsFixed(0)} kg',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                children: [
                  Container(
                    height: 8,
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
                  FractionallySizedBox(
                    widthFactor: (monthlyKg / targetKg).clamp(0, 1),
                    child: Container(
                      height: 8,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFFFF59D), Color(0xFFFFFFFF)],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Capai ${(monthlyKg / targetKg * 100).clamp(0, 100).toStringAsFixed(0)}% dari target bulan ini',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionSquares() {
    return Row(
      children: [
        Expanded(
          child: ActionSquare(
            label: 'Setor',
            icon: Icons.delete_outline,
            onTap: onSetorTap,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ActionSquare(
            label: 'Tukar',
            icon: Icons.card_giftcard,
            onTap: onRewardTap,
          ),
        ),
      ],
    );
  }

  Widget _buildTipsCarousel() {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        key: const PageStorageKey('tips_carousel'),
        scrollDirection: Axis.horizontal,
        itemCount: edukasiItems.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final edu = edukasiItems[index];
          final accent = Colors.primaries[index % Colors.primaries.length];
          return Container(
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: LinearGradient(
                colors: [accent.shade300, accent.shade700],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: accent.withValues(alpha: 0.35),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.white.withValues(alpha: 0.85),
                  child: Icon(edu.icon, color: accent.shade700, size: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  edu.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  edu.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
