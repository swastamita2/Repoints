import 'package:flutter/material.dart';

import '../models/history_entry.dart';

class HistoryTile extends StatelessWidget {
  final HistoryEntry entry;

  const HistoryTile({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: entry.isGain
              ? Colors.green.shade100
              : Colors.orange.shade100,
          child: Icon(
            entry.isGain ? Icons.eco : Icons.confirmation_number_outlined,
            color: entry.isGain ? Colors.green : Colors.orange,
          ),
        ),
        title: Text(
          entry.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(entry.detail),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              entry.isGain ? '+${entry.pointsDelta}' : '${entry.pointsDelta}',
              style: TextStyle(
                color: entry.isGain ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              entry.dateLabel,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
