class FormatUtils {
  /// Format angka dengan pemisah ribuan (koma)
  /// Contoh: 1234567 -> 1,234,567
  static String formatNumber(int value) {
    final str = value.toString();
    final buffer = StringBuffer();
    for (int i = 0; i < str.length; i++) {
      final positionFromEnd = str.length - i;
      buffer.write(str[i]);
      final isThousandBoundary =
          positionFromEnd > 1 && positionFromEnd % 3 == 1;
      if (isThousandBoundary) buffer.write(',');
    }
    return buffer.toString();
  }

  /// Format tanggal ke format Indonesia
  /// Contoh: DateTime(2024, 12, 1) -> "1 Des 2024"
  static String formatDate(DateTime date) {
    const months = [
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
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}
