import 'package:flutter/material.dart';

import '../app/app_state.dart';
import '../app/repoint_app.dart';
import '../features/admin/admin_dashboard_page.dart';
import '../features/admin/admin_rewards_page.dart';
import '../features/admin/admin_transactions_page.dart';
import '../features/admin/admin_users_page.dart';
import '../features/auth/login_page.dart';

class AdminShell extends StatefulWidget {
  final String adminName;
  final String adminEmail;

  const AdminShell({
    super.key,
    required this.adminName,
    required this.adminEmail,
  });

  @override
  State<AdminShell> createState() => _AdminShellState();
}

class _AdminShellState extends State<AdminShell> {
  int _selectedIndex = 0;
  final AppState _appState = AppState();

  final List<String> _navLabels = const [
    'Dashboard',
    'Users',
    'Transaksi',
    'Rewards',
  ];

  final List<IconData> _navIcons = const [
    Icons.dashboard,
    Icons.people,
    Icons.receipt_long,
    Icons.card_giftcard,
  ];

  void _onLogout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi Logout'),
        content: const Text('Apakah Anda yakin ingin keluar?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return IndexedStack(
      index: _selectedIndex,
      children: [
        AdminDashboardPage(
          key: const PageStorageKey('admin_dashboard'),
          adminName: widget.adminName,
          appState: _appState,
        ),
        AdminUsersPage(
          key: const PageStorageKey('admin_users'),
          appState: _appState,
        ),
        AdminTransactionsPage(
          key: const PageStorageKey('admin_transactions'),
          appState: _appState,
        ),
        AdminRewardsPage(
          key: const PageStorageKey('admin_rewards'),
          appState: _appState,
        ),
      ],
    );
  }

  Widget _buildBottomNav() {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_navLabels.length, (index) {
          final selected = index == _selectedIndex;
          return GestureDetector(
            onTap: () => setState(() => _selectedIndex = index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _navIcons[index],
                  color: selected ? RePointApp.primaryGreen : Colors.grey,
                ),
                const SizedBox(height: 4),
                Text(
                  _navLabels[index],
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                    color: selected ? RePointApp.primaryGreen : Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: RePointApp.primaryGreen,
        elevation: 0,
        title: Row(
          children: [
            Image.asset('asset/logo_utama.png', height: 32),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Admin Panel',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'RePoints Management',
                  style: TextStyle(color: Colors.white70, fontSize: 11),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: _onLogout,
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Stack(
        children: [
          SafeArea(bottom: false, child: _buildBody()),
          Positioned(bottom: 0, left: 0, right: 0, child: _buildBottomNav()),
        ],
      ),
    );
  }
}
