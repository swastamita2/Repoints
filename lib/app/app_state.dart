import 'package:flutter/material.dart';

import '../models/admin_stats.dart';
import '../models/history_entry.dart';
import '../models/notification_item.dart';
import '../models/reward_item.dart';
import '../models/user_profile.dart';

/// Global app state untuk share data antara User dan Admin
/// Tanpa database, semua data disimpan di memory
class AppState extends ChangeNotifier {
  // Singleton pattern
  static final AppState _instance = AppState._internal();
  factory AppState() => _instance;
  AppState._internal() {
    _initializeDummyData();
  }

  // ===== USER DATA =====
  final List<UserProfile> _allUsers = [];
  List<UserProfile> get allUsers => List.unmodifiable(_allUsers);

  // ===== TRANSACTION DATA =====
  final List<HistoryEntry> _allTransactions = [];
  List<HistoryEntry> get allTransactions => List.unmodifiable(_allTransactions);

  // ===== REWARD CATALOG =====
  final List<RewardItem> _rewards = [
    RewardItem(
      title: 'Voucher Kopi Kampus',
      cost: 450,
      description: 'Satu cup kopi dari kedai kampus',
      icon: Icons.coffee,
      accent: const Color(0xFF8BC34A),
      imagePath: 'asset/Katalog_reward/Voucher_Kopi_Kampus.png',
      stock: 50,
    ),
    RewardItem(
      title: 'Tumbler Ekslusif',
      cost: 520,
      description: 'Tumbler stainless untuk air minum',
      icon: Icons.water_drop,
      accent: const Color(0xFF388E3C),
      imagePath: 'asset/Katalog_reward/Tumbler_Ekslusif.png',
      stock: 30,
    ),
    RewardItem(
      title: 'ToteBag RePoints',
      cost: 380,
      description: 'Tas belanja ramah lingkungan',
      icon: Icons.shopping_bag,
      accent: const Color(0xFF4CAF50),
      imagePath: 'asset/Katalog_reward/ToteBag_RePoints.png',
      stock: 100,
    ),
    RewardItem(
      title: 'Voucher Minimarket Gorong',
      cost: 500,
      description: 'Voucher belanja minimarket',
      icon: Icons.store,
      accent: const Color(0xFF66BB6A),
      imagePath: 'asset/Katalog_reward/Voucher_Minimarket_Gorong.png',
      stock: 40,
    ),
    RewardItem(
      title: 'Voucher Print Gorong',
      cost: 350,
      description: 'Voucher print dan fotokopi',
      icon: Icons.print,
      accent: const Color(0xFF81C784),
      imagePath: 'asset/Katalog_reward/Voucher_Print_Gorong.png',
      stock: 60,
    ),
    RewardItem(
      title: 'Kaos RePoints',
      cost: 600,
      description: 'Kaos eksklusif RePoints',
      icon: Icons.checkroom,
      accent: const Color(0xFF4CAF50),
      imagePath: 'asset/Katalog_reward/Kaos_RePoints.png',
      stock: 25,
    ),
  ];
  List<RewardItem> get rewards => List.unmodifiable(_rewards);

  // ===== NOTIFICATIONS =====
  final List<NotificationItem> _allNotifications = [];
  List<NotificationItem> get allNotifications =>
      List.unmodifiable(_allNotifications);

  // ===== RATES =====
  static const Map<String, double> ratePerKg = {
    'Plastik': 100,
    'Kertas': 50,
    'Logam': 120,
    'Kaca': 90,
  };

  // ===== USER MANAGEMENT =====
  void registerUser(UserProfile user) {
    // Check if user already exists
    final exists = _allUsers.any((u) => u.email == user.email);
    if (!exists) {
      _allUsers.add(user);
      notifyListeners();
    }
  }

  UserProfile? getUserById(String userId) {
    try {
      return _allUsers.firstWhere((u) => u.id == userId);
    } catch (e) {
      return null;
    }
  }

  void updateUser(UserProfile updatedUser) {
    final index = _allUsers.indexWhere((u) => u.id == updatedUser.id);
    if (index != -1) {
      _allUsers[index] = updatedUser;
      notifyListeners();
    }
  }

  // ===== TRANSACTION MANAGEMENT =====
  void addTransaction(HistoryEntry transaction, String userId) {
    _allTransactions.insert(0, transaction);

    // Add notification
    if (transaction.isGain) {
      _allNotifications.insert(
        0,
        NotificationItem(
          id: 'notif-${DateTime.now().millisecondsSinceEpoch}',
          title: 'Setoran Diterima ✓',
          subtitle: transaction.detail,
          date: DateTime.now(),
          type: NotificationType.deposit,
        ),
      );
    } else {
      _allNotifications.insert(
        0,
        NotificationItem(
          id: 'notif-${DateTime.now().millisecondsSinceEpoch}',
          title: 'Penukaran Berhasil 🎁',
          subtitle: transaction.title,
          date: DateTime.now(),
          type: NotificationType.redemption,
        ),
      );
    }

    notifyListeners();
  }

  List<HistoryEntry> getTransactionsByUserId(String userId) {
    // Filter transactions by userId if needed
    // For now return all since we don't store userId in HistoryEntry
    return _allTransactions;
  }

  // ===== REWARD MANAGEMENT =====
  void addReward(RewardItem reward) {
    _rewards.add(reward);
    notifyListeners();
  }

  void updateReward(RewardItem updatedReward) {
    final index = _rewards.indexWhere((r) => r.id == updatedReward.id);
    if (index != -1) {
      _rewards[index] = updatedReward;
      notifyListeners();
    }
  }

  void deleteReward(String rewardId) {
    _rewards.removeWhere((r) => r.id == rewardId);
    notifyListeners();
  }

  bool checkAndReduceStock(String rewardId) {
    final index = _rewards.indexWhere((r) => r.id == rewardId);
    if (index != -1 && _rewards[index].stock > 0) {
      _rewards[index].stock--;
      notifyListeners();
      return true;
    }
    return false;
  }

  // ===== STATISTICS =====
  AdminStats calculateStats() {
    int totalMahasiswa = _allUsers
        .where((u) => u.userRole == 'Mahasiswa')
        .length;
    int totalDosen = _allUsers.where((u) => u.userRole == 'Dosen').length;
    int totalStaff = _allUsers
        .where((u) => u.userRole == 'Tendik/Staff')
        .length;

    double totalKg = 0;
    int totalPoints = 0;
    int deposits = 0;
    int redemptions = 0;

    final depositsByType = <String, double>{
      'Plastik': 0,
      'Kertas': 0,
      'Logam': 0,
      'Kaca': 0,
    };

    for (var transaction in _allTransactions) {
      if (transaction.isGain) {
        deposits++;
        totalPoints += transaction.pointsDelta;

        // Parse kg from detail (e.g., "2.0 kg • 200 poin")
        final kgMatch = RegExp(
          r'(\d+\.?\d*)\s*kg',
        ).firstMatch(transaction.detail);
        if (kgMatch != null) {
          final kg = double.tryParse(kgMatch.group(1) ?? '0') ?? 0;
          totalKg += kg;

          // Detect type from title
          for (var type in depositsByType.keys) {
            if (transaction.title.contains(type)) {
              depositsByType[type] = (depositsByType[type] ?? 0) + kg;
              break;
            }
          }
        }
      } else {
        redemptions++;
      }
    }

    // Calculate today's transactions
    // Since HistoryEntry only has dateLabel string, count all for now
    final todayCount = _allTransactions.length;

    // Group users by faculty
    final usersByFaculty = <String, int>{};
    for (var user in _allUsers) {
      if (user.userRole == 'Mahasiswa') {
        // Extract faculty from department (contains jurusan)
        // For now use department as is
        usersByFaculty[user.department] =
            (usersByFaculty[user.department] ?? 0) + 1;
      }
    }

    // Top contributors (mock data for now)
    final topContributors = <TopContributor>[];

    return AdminStats(
      totalUsers: _allUsers.length,
      totalMahasiswa: totalMahasiswa,
      totalDosen: totalDosen,
      totalStaff: totalStaff,
      totalKgCollected: totalKg,
      totalPointsDistributed: totalPoints,
      todayTransactions: todayCount,
      totalDeposits: deposits,
      totalRedemptions: redemptions,
      usersByFaculty: usersByFaculty,
      topContributors: topContributors,
      depositsByType: depositsByType,
    );
  }

  // ===== INITIALIZE DUMMY DATA =====
  void _initializeDummyData() {
    // Dummy Users
    final dummyUsers = [
      UserProfile(
        id: 'budi.santoso@student.itpln.ac.id',
        name: 'Budi Santoso',
        email: 'budi.santoso@student.itpln.ac.id',
        phone: '081234567891',
        userRole: 'Mahasiswa',
        identityNumber: '2106001',
        university: 'IT PLN',
        department: 'Teknik Informatika',
        joinDate: DateTime.now().subtract(const Duration(days: 90)),
      ),
      UserProfile(
        id: 'siti.nurhaliza@student.itpln.ac.id',
        name: 'Siti Nurhaliza',
        email: 'siti.nurhaliza@student.itpln.ac.id',
        phone: '081234567892',
        userRole: 'Mahasiswa',
        identityNumber: '2106002',
        university: 'IT PLN',
        department: 'Teknik Elektro',
        joinDate: DateTime.now().subtract(const Duration(days: 75)),
      ),
      UserProfile(
        id: 'ahmad.fauzi@student.itpln.ac.id',
        name: 'Ahmad Fauzi',
        email: 'ahmad.fauzi@student.itpln.ac.id',
        phone: '081234567893',
        userRole: 'Mahasiswa',
        identityNumber: '2106003',
        university: 'IT PLN',
        department: 'Teknik Mesin',
        joinDate: DateTime.now().subtract(const Duration(days: 60)),
      ),
      UserProfile(
        id: 'rina.wati@student.itpln.ac.id',
        name: 'Rina Wati',
        email: 'rina.wati@student.itpln.ac.id',
        phone: '081234567894',
        userRole: 'Mahasiswa',
        identityNumber: '2106004',
        university: 'IT PLN',
        department: 'Teknik Sipil',
        joinDate: DateTime.now().subtract(const Duration(days: 45)),
      ),
      UserProfile(
        id: 'dedi.kurniawan@student.itpln.ac.id',
        name: 'Dedi Kurniawan',
        email: 'dedi.kurniawan@student.itpln.ac.id',
        phone: '081234567895',
        userRole: 'Mahasiswa',
        identityNumber: '2106005',
        university: 'IT PLN',
        department: 'Teknik Informatika',
        joinDate: DateTime.now().subtract(const Duration(days: 30)),
      ),
      UserProfile(
        id: 'dr.agus.wijaya@lecturer.itpln.ac.id',
        name: 'Dr. Agus Wijaya',
        email: 'dr.agus.wijaya@lecturer.itpln.ac.id',
        phone: '081234567896',
        userRole: 'Dosen',
        identityNumber: '198501012020121001',
        university: 'IT PLN',
        department: 'Fakultas Teknik',
        joinDate: DateTime.now().subtract(const Duration(days: 120)),
      ),
      UserProfile(
        id: 'dr.linda.sari@lecturer.itpln.ac.id',
        name: 'Dr. Linda Sari',
        email: 'dr.linda.sari@lecturer.itpln.ac.id',
        phone: '081234567897',
        userRole: 'Dosen',
        identityNumber: '198701012020121002',
        university: 'IT PLN',
        department: 'Fakultas Teknik',
        joinDate: DateTime.now().subtract(const Duration(days: 100)),
      ),
      UserProfile(
        id: 'yanto.staff@staff.itpln.ac.id',
        name: 'Yanto',
        email: 'yanto.staff@staff.itpln.ac.id',
        phone: '081234567898',
        userRole: 'Tendik/Staff',
        identityNumber: '199001012020121001',
        university: 'IT PLN',
        department: 'Akademik',
        joinDate: DateTime.now().subtract(const Duration(days: 150)),
      ),
    ];

    _allUsers.addAll(dummyUsers);

    // Dummy Transactions
    final dummyTransactions = [
      const HistoryEntry(
        title: 'Setor Sampah Plastik',
        detail: '2.5 kg • 250 poin',
        dateLabel: 'Hari ini',
        pointsDelta: 250,
        isGain: true,
      ),
      const HistoryEntry(
        title: 'Setor Sampah Kertas',
        detail: '3.0 kg • 150 poin',
        dateLabel: 'Kemarin',
        pointsDelta: 150,
        isGain: true,
      ),
      const HistoryEntry(
        title: 'Penukaran: Voucher Kopi Kampus',
        detail: '450 poin',
        dateLabel: '2 Hari lalu',
        pointsDelta: -450,
        isGain: false,
      ),
      const HistoryEntry(
        title: 'Setor Sampah Logam',
        detail: '1.8 kg • 216 poin',
        dateLabel: '3 Hari lalu',
        pointsDelta: 216,
        isGain: true,
      ),
      const HistoryEntry(
        title: 'Setor Sampah Kaca',
        detail: '2.0 kg • 180 poin',
        dateLabel: '4 Hari lalu',
        pointsDelta: 180,
        isGain: true,
      ),
      const HistoryEntry(
        title: 'Penukaran: ToteBag RePoints',
        detail: '380 poin',
        dateLabel: '5 Hari lalu',
        pointsDelta: -380,
        isGain: false,
      ),
      const HistoryEntry(
        title: 'Setor Sampah Plastik',
        detail: '4.2 kg • 420 poin',
        dateLabel: '1 Minggu lalu',
        pointsDelta: 420,
        isGain: true,
      ),
      const HistoryEntry(
        title: 'Setor Sampah Kertas',
        detail: '5.5 kg • 275 poin',
        dateLabel: '1 Minggu lalu',
        pointsDelta: 275,
        isGain: true,
      ),
      const HistoryEntry(
        title: 'Penukaran: Tumbler Ekslusif',
        detail: '520 poin',
        dateLabel: '2 Minggu lalu',
        pointsDelta: -520,
        isGain: false,
      ),
      const HistoryEntry(
        title: 'Setor Sampah Logam',
        detail: '3.5 kg • 420 poin',
        dateLabel: '2 Minggu lalu',
        pointsDelta: 420,
        isGain: true,
      ),
    ];

    _allTransactions.addAll(dummyTransactions);

    // Dummy Notifications
    final dummyNotifications = [
      NotificationItem(
        id: 'notif-1',
        title: 'Setoran Diterima ✓',
        subtitle: '2.5 kg Plastik • +250 poin',
        date: DateTime.now(),
        type: NotificationType.deposit,
      ),
      NotificationItem(
        id: 'notif-2',
        title: 'Penukaran Berhasil 🎁',
        subtitle: 'Voucher Kopi Kampus',
        date: DateTime.now().subtract(const Duration(hours: 12)),
        type: NotificationType.redemption,
      ),
      NotificationItem(
        id: 'notif-3',
        title: 'Setoran Diterima ✓',
        subtitle: '1.8 kg Logam • +216 poin',
        date: DateTime.now().subtract(const Duration(days: 1)),
        type: NotificationType.deposit,
      ),
      NotificationItem(
        id: 'notif-4',
        title: 'Setoran Diterima ✓',
        subtitle: '3.0 kg Kertas • +150 poin',
        date: DateTime.now().subtract(const Duration(days: 2)),
        type: NotificationType.deposit,
      ),
      NotificationItem(
        id: 'notif-5',
        title: 'Penukaran Berhasil 🎁',
        subtitle: 'ToteBag RePoints',
        date: DateTime.now().subtract(const Duration(days: 3)),
        type: NotificationType.redemption,
      ),
    ];

    _allNotifications.addAll(dummyNotifications);
  }
}
