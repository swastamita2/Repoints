import 'package:flutter/material.dart';

import '../../models/notification_item.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample notifications data
    final notifications = [
      NotificationItem(
        id: '1',
        title: 'Setoran Diterima',
        subtitle: 'Setor Botol Plastik',
        date: DateTime(2025, 10, 20),
        type: NotificationType.deposit,
      ),
      NotificationItem(
        id: '2',
        title: 'Penukaran Berhasil',
        subtitle: 'Voucher Kopi kampus',
        date: DateTime(2025, 11, 5),
        type: NotificationType.redemption,
      ),
      NotificationItem(
        id: '3',
        title: 'Setoran Diterima',
        subtitle: 'Setor Botol Plastik',
        date: DateTime(2025, 11, 5),
        type: NotificationType.deposit,
      ),
      NotificationItem(
        id: '4',
        title: 'Penukaran Berhasil',
        subtitle: 'Tumblr Ekslusif',
        date: DateTime(2025, 11, 5),
        type: NotificationType.redemption,
      ),
      NotificationItem(
        id: '5',
        title: 'Penukaran Berhasil',
        subtitle: 'ToteBag RePoints',
        date: DateTime(2025, 11, 5),
        type: NotificationType.redemption,
      ),
      NotificationItem(
        id: '6',
        title: 'Penukaran Berhasil',
        subtitle: 'Voucher Minimarket Gorong',
        date: DateTime(2025, 11, 5),
        type: NotificationType.redemption,
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Notifikasi',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset('asset/logo_utama.png', height: 40),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return _buildNotificationCard(notification);
        },
      ),
    );
  }

  Widget _buildNotificationCard(NotificationItem notification) {
    // Format tanggal manual untuk menghindari locale error
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des',
    ];
    final formattedDate =
        '${notification.date.day} ${months[notification.date.month - 1]} ${notification.date.year}';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: notification.iconColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                notification.icon,
                color: notification.iconColor,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification.subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Date
            Text(
              formattedDate,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            ),
          ],
        ),
      ),
    );
  }
}
