import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:convert';

import '../../app/app_state.dart';
import '../../app/repoint_app.dart';
import '../../models/admin_stats.dart';

class AdminDashboardPage extends StatelessWidget {
  final String adminName;
  final AppState appState;

  const AdminDashboardPage({
    super.key,
    required this.adminName,
    required this.appState,
  });

  @override
  Widget build(BuildContext context) {
    final stats = appState.calculateStats();

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWelcomeHeader(),
          const SizedBox(height: 24),
          _buildOverviewCards(stats),
          const SizedBox(height: 24),
          _buildUserBreakdown(stats),
          const SizedBox(height: 24),
          _buildDepositsByType(stats),
          const SizedBox(height: 24),
          _buildQuickActions(context),
        ],
      ),
    );
  }

  Widget _buildWelcomeHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1B5E20), Color(0xFF4CAF50)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.admin_panel_settings,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome, ${adminName.split(' ')[0]}!',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Admin Dashboard • RePoints',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewCards(AdminStats stats) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Overview Statistik',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.3,
          children: [
            _buildStatCard(
              'Total Users',
              '${stats.totalUsers}',
              Icons.people,
              Colors.blue,
            ),
            _buildStatCard(
              'Total Sampah',
              '${stats.totalKgCollected.toStringAsFixed(1)} kg',
              Icons.delete_outline,
              Colors.green,
            ),
            _buildStatCard(
              'Total Poin',
              '${stats.totalPointsDistributed}',
              Icons.stars,
              Colors.orange,
            ),
            _buildStatCard(
              'Transaksi',
              '${stats.totalDeposits + stats.totalRedemptions}',
              Icons.receipt_long,
              Colors.purple,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 4),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserBreakdown(AdminStats stats) {
    return Container(
      padding: const EdgeInsets.all(20),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Users by Role',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildRoleRow('Mahasiswa', stats.totalMahasiswa, Colors.blue),
          const SizedBox(height: 12),
          _buildRoleRow('Dosen', stats.totalDosen, Colors.green),
          const SizedBox(height: 12),
          _buildRoleRow('Tendik/Staff', stats.totalStaff, Colors.orange),
        ],
      ),
    );
  }

  Widget _buildRoleRow(String role, int count, Color color) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            role,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          '$count user${count > 1 ? 's' : ''}',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildDepositsByType(AdminStats stats) {
    return Container(
      padding: const EdgeInsets.all(20),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sampah Terkumpul per Jenis',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ...stats.depositsByType.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      entry.key,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: entry.value / (stats.totalKgCollected + 0.01),
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          RePointApp.primaryGreen,
                        ),
                        minHeight: 8,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 60,
                    child: Text(
                      '${entry.value.toStringAsFixed(1)} kg',
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Actions',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.2,
          children: [
            _buildActionButton('View Users', Icons.people, Colors.blue, () {
              // Will navigate via bottom nav
            }),
            _buildActionButton(
              'Manage Rewards',
              Icons.card_giftcard,
              Colors.orange,
              () {
                // Will navigate via bottom nav
              },
            ),
            _buildActionButton(
              'Export Laporan',
              Icons.download,
              Colors.green,
              () => _showExportDialog(context),
            ),
          ],
        ),
      ],
    );
  }

  void _showExportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Export Laporan'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Pilih jenis laporan yang ingin diexport:'),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.receipt_long, color: Colors.blue),
              title: const Text('Laporan Transaksi'),
              subtitle: const Text('Semua deposit & redemption'),
              onTap: () {
                Navigator.pop(context);
                _exportTransactions();
              },
            ),
            ListTile(
              leading: const Icon(Icons.people, color: Colors.green),
              title: const Text('Laporan Pengguna'),
              subtitle: const Text('Daftar user dengan statistik'),
              onTap: () {
                Navigator.pop(context);
                _exportUsers();
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete_outline, color: Colors.orange),
              title: const Text('Laporan Sampah'),
              subtitle: const Text('Data sampah per jenis'),
              onTap: () {
                Navigator.pop(context);
                _exportWaste();
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
        ],
      ),
    );
  }

  void _exportTransactions() {
    final transactions = appState.allTransactions;

    // Header CSV
    final csvContent = StringBuffer();
    csvContent.writeln('No,Tipe,Judul,Detail,Tanggal,Poin');

    // Data rows
    for (var i = 0; i < transactions.length; i++) {
      final t = transactions[i];
      final type = t.isGain ? 'Deposit' : 'Redemption';
      csvContent.writeln(
        '${i + 1},$type,"${t.title}","${t.detail}",${t.dateLabel},${t.pointsDelta}',
      );
    }

    _downloadCsv(
      'Laporan_Transaksi_${_getDateString()}.csv',
      csvContent.toString(),
    );
  }

  void _exportUsers() {
    final users = appState.allUsers;

    // Header CSV
    final csvContent = StringBuffer();
    csvContent.writeln(
      'No,Nama,Email,Role,NIM/NIP,Jurusan/Unit,Universitas,Tanggal Bergabung',
    );

    // Data rows
    for (var i = 0; i < users.length; i++) {
      final u = users[i];
      final joinDate =
          '${u.joinDate.day}/${u.joinDate.month}/${u.joinDate.year}';
      csvContent.writeln(
        '${i + 1},"${u.name}",${u.email},${u.userRole},${u.identityNumber},"${u.department}",${u.university},$joinDate',
      );
    }

    _downloadCsv(
      'Laporan_Pengguna_${_getDateString()}.csv',
      csvContent.toString(),
    );
  }

  void _exportWaste() {
    final stats = appState.calculateStats();

    // Header CSV
    final csvContent = StringBuffer();
    csvContent.writeln('Jenis Sampah,Total (kg),Persentase');

    final total = stats.totalKgCollected;

    // Data rows
    stats.depositsByType.forEach((type, kg) {
      final percentage = total > 0
          ? (kg / total * 100).toStringAsFixed(1)
          : '0.0';
      csvContent.writeln('$type,$kg,$percentage%');
    });

    csvContent.writeln('');
    csvContent.writeln('RINGKASAN');
    csvContent.writeln('Total Sampah Terkumpul,$total kg');
    csvContent.writeln(
      'Total Poin Terdistribusi,${stats.totalPointsDistributed}',
    );
    csvContent.writeln('Total Deposit,${stats.totalDeposits}');
    csvContent.writeln('Total Redemption,${stats.totalRedemptions}');

    _downloadCsv(
      'Laporan_Sampah_${_getDateString()}.csv',
      csvContent.toString(),
    );
  }

  void _downloadCsv(String filename, String content) {
    // Convert to bytes with UTF-8 BOM for Excel compatibility
    final bytes = utf8.encode('\uFEFF$content');
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    // ignore: unused_local_variable
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', filename)
      ..click();
    html.Url.revokeObjectUrl(url);
  }

  String _getDateString() {
    final now = DateTime.now();
    return '${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}';
  }

  Widget _buildActionButton(
    String label,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
