import 'package:flutter/material.dart';

import '../../models/history_entry.dart';
import '../../widgets/history_tile.dart';

class HistoryPage extends StatelessWidget {
  final List<HistoryEntry> history;

  const HistoryPage({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: history.length,
        itemBuilder: (context, index) => HistoryTile(entry: history[index]),
      ),
    );
  }
}
