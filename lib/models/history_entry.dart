class HistoryEntry {
  final String title;
  final String detail;
  final String dateLabel;
  final int pointsDelta;
  final bool isGain;

  const HistoryEntry({
    required this.title,
    required this.detail,
    required this.dateLabel,
    required this.pointsDelta,
    required this.isGain,
  });
}
