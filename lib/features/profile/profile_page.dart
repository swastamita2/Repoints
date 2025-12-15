import 'package:flutter/material.dart';

import '../../app/repoint_app.dart';
import '../../models/user_profile.dart';
import '../../utils/format_utils.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatelessWidget {
  final UserProfile user;
  final int userPoints;
  final double monthlyKg;
  final String levelLabel;
  final int totalTransactions;
  final Function(UserProfile) onProfileUpdated;

  const ProfilePage({
    super.key,
    required this.user,
    required this.userPoints,
    required this.monthlyKg,
    required this.levelLabel,
    required this.totalTransactions,
    required this.onProfileUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Header
          _buildProfileHeader(context),
          const SizedBox(height: 24),

          // Statistics Cards
          _buildStatisticsCards(),
          const SizedBox(height: 24),

          // Level Progress
          _buildLevelProgress(),
          const SizedBox(height: 24),

          // Achievements Section
          _buildAchievements(),
          const SizedBox(height: 24),

          // Account Information
          _buildAccountInfo(),
          const SizedBox(height: 24),

          // Settings Menu
          _buildSettingsMenu(context),
          const SizedBox(height: 24),

          // Logout Button
          _buildLogoutButton(context),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: RePointApp.primaryGreen.withValues(alpha: 0.1),
                child: user.profileImage.isNotEmpty
                    ? ClipOval(
                        child: Image.network(
                          user.profileImage,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Text(
                            user.initials,
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: RePointApp.primaryGreen,
                            ),
                          ),
                        ),
                      )
                    : Text(
                        user.initials,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: RePointApp.primaryGreen,
                        ),
                      ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: RePointApp.primaryGreen,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(
                    Icons.verified,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  user.university,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  user.faculty,
                  style: TextStyle(color: Colors.grey[500], fontSize: 12),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit, color: RePointApp.primaryGreen),
            onPressed: () => _navigateToEditProfile(context),
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticsCards() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            icon: Icons.stars,
            title: 'Total Poin',
            value: FormatUtils.formatNumber(userPoints),
            color: const Color(0xFFFFB74D),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            icon: Icons.recycling,
            title: 'Transaksi',
            value: totalTransactions.toString(),
            color: const Color(0xFF4CAF50),
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildLevelProgress() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            RePointApp.primaryGreen,
            RePointApp.primaryGreen.withValues(alpha: 0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: RePointApp.primaryGreen.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Level Saat Ini',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  levelLabel,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.eco, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              Text(
                '${monthlyKg.toStringAsFixed(1)} kg',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'Sampah Disetorkan Bulan Ini',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: (monthlyKg % 50) / 50,
              backgroundColor: Colors.white.withValues(alpha: 0.3),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${(50 - (monthlyKg % 50)).toStringAsFixed(1)} kg lagi untuk level selanjutnya',
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievements() {
    final achievements = [
      {
        'icon': Icons.military_tech,
        'title': 'Pemula',
        'achieved': true,
        'color': const Color(0xFFFFB74D),
      },
      {
        'icon': Icons.volunteer_activism,
        'title': 'Peduli',
        'achieved': true,
        'color': const Color(0xFF4CAF50),
      },
      {
        'icon': Icons.public,
        'title': 'Eco Hero',
        'achieved': totalTransactions >= 10,
        'color': const Color(0xFF2196F3),
      },
      {
        'icon': Icons.star,
        'title': 'Champion',
        'achieved': false,
        'color': const Color(0xFF9C27B0),
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pencapaian',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: achievements.map((achievement) {
              return Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: achievement['achieved'] as bool
                          ? (achievement['color'] as Color).withValues(
                              alpha: 0.1,
                            )
                          : Colors.grey[200],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      achievement['icon'] as IconData,
                      color: achievement['achieved'] as bool
                          ? achievement['color'] as Color
                          : Colors.grey[400],
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    achievement['title'] as String,
                    style: TextStyle(
                      fontSize: 11,
                      color: achievement['achieved'] as bool
                          ? Colors.black87
                          : Colors.grey[400],
                      fontWeight: achievement['achieved'] as bool
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildAccountInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Informasi Akun',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              _buildInfoTile(
                icon: Icons.email,
                title: 'Email',
                value: user.email,
              ),
              _buildDivider(),
              _buildInfoTile(
                icon: Icons.phone,
                title: 'Nomor HP',
                value: user.phone,
              ),
              _buildDivider(),
              _buildInfoTile(
                icon: Icons.school,
                title: 'Program Studi',
                value: user.major,
              ),
              _buildDivider(),
              _buildInfoTile(icon: Icons.badge, title: 'NIM', value: user.nim),
              _buildDivider(),
              _buildInfoTile(
                icon: Icons.calendar_today,
                title: 'Bergabung',
                value: FormatUtils.formatDate(user.joinDate),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: RePointApp.primaryGreen, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey[200],
      indent: 48,
    );
  }

  Widget _buildSettingsMenu(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pengaturan',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              _buildMenuTile(
                icon: Icons.notifications,
                title: 'Notifikasi',
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Fitur notifikasi akan segera hadir'),
                    ),
                  );
                },
              ),
              _buildDivider(),
              _buildMenuTile(
                icon: Icons.lock,
                title: 'Privasi & Keamanan',
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Fitur privasi akan segera hadir'),
                    ),
                  );
                },
              ),
              _buildDivider(),
              _buildMenuTile(
                icon: Icons.language,
                title: 'Bahasa',
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Indonesia',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.chevron_right),
                  ],
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Fitur bahasa akan segera hadir'),
                    ),
                  );
                },
              ),
              _buildDivider(),
              _buildMenuTile(
                icon: Icons.help,
                title: 'Bantuan & FAQ',
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Fitur bantuan akan segera hadir'),
                    ),
                  );
                },
              ),
              _buildDivider(),
              _buildMenuTile(
                icon: Icons.info,
                title: 'Tentang Aplikasi',
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  _showAboutDialog(context);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuTile({
    required IconData icon,
    required String title,
    required Widget trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: RePointApp.primaryGreen),
      title: Text(title),
      trailing: trailing,
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _showLogoutDialog(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout),
            SizedBox(width: 8),
            Text(
              'Keluar',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToEditProfile(BuildContext context) async {
    final result = await Navigator.push<UserProfile>(
      context,
      MaterialPageRoute(builder: (context) => EditProfilePage(user: user)),
    );

    if (result != null) {
      onProfileUpdated(result);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profil berhasil diperbarui'),
            backgroundColor: Color(0xFF4CAF50),
          ),
        );
      }
    }
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Keluar'),
        content: const Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              // Navigate back to login page (clear all routes)
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil('/', (route) => false);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Keluar'),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.recycling, color: RePointApp.primaryGreen),
            const SizedBox(width: 8),
            const Text('Tentang RePoint'),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'RePoint',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Versi 1.0.0'),
            SizedBox(height: 16),
            Text(
              'Aplikasi pengelolaan sampah berbasis poin untuk mahasiswa.',
              style: TextStyle(height: 1.5),
            ),
            SizedBox(height: 16),
            Text(
              '© 2024 RePoint. All rights reserved.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }
}
