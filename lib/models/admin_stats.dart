class AdminStats {
  final int totalUsers;
  final int totalMahasiswa;
  final int totalDosen;
  final int totalStaff;
  final double totalKgCollected;
  final int totalPointsDistributed;
  final int todayTransactions;
  final int totalDeposits;
  final int totalRedemptions;
  final Map<String, int> usersByFaculty;
  final List<TopContributor> topContributors;
  final Map<String, double> depositsByType; // Plastik, Kertas, dll

  AdminStats({
    required this.totalUsers,
    required this.totalMahasiswa,
    required this.totalDosen,
    required this.totalStaff,
    required this.totalKgCollected,
    required this.totalPointsDistributed,
    required this.todayTransactions,
    required this.totalDeposits,
    required this.totalRedemptions,
    required this.usersByFaculty,
    required this.topContributors,
    required this.depositsByType,
  });

  AdminStats.empty()
    : totalUsers = 0,
      totalMahasiswa = 0,
      totalDosen = 0,
      totalStaff = 0,
      totalKgCollected = 0.0,
      totalPointsDistributed = 0,
      todayTransactions = 0,
      totalDeposits = 0,
      totalRedemptions = 0,
      usersByFaculty = {},
      topContributors = [],
      depositsByType = {};
}

class TopContributor {
  final String userId;
  final String userName;
  final String userRole;
  final String department;
  final double totalKg;
  final int totalPoints;
  final int transactionCount;

  TopContributor({
    required this.userId,
    required this.userName,
    required this.userRole,
    required this.department,
    required this.totalKg,
    required this.totalPoints,
    required this.transactionCount,
  });
}
