import 'package:flutter/material.dart';

import '../../app/app_state.dart';
import '../../app/repoint_app.dart';
import '../../models/history_entry.dart';

class AdminTransactionsPage extends StatefulWidget {
  final AppState appState;

  const AdminTransactionsPage({super.key, required this.appState});

  @override
  State<AdminTransactionsPage> createState() => _AdminTransactionsPageState();
}

class _AdminTransactionsPageState extends State<AdminTransactionsPage> {
  String _filterType = 'All';

  List<HistoryEntry> get _filteredTransactions {
    var transactions = widget.appState.allTransactions;

    if (_filterType == 'Deposits') {
      return transactions.where((t) => t.isGain).toList();
    } else if (_filterType == 'Redemptions') {
      return transactions.where((t) => !t.isGain).toList();
    }

    return transactions;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        _buildFilterBar(),
        Expanded(child: _buildTransactionList()),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'All Transactions',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Total: ${widget.appState.allTransactions.length} transactions',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildFilterChip('All'),
            _buildFilterChip('Deposits'),
            _buildFilterChip('Redemptions'),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String type) {
    final isSelected = _filterType == type;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(type),
        selected: isSelected,
        onSelected: (selected) {
          setState(() => _filterType = type);
        },
        selectedColor: RePointApp.primaryGreen.withValues(alpha: 0.2),
        checkmarkColor: RePointApp.primaryGreen,
      ),
    );
  }

  Widget _buildTransactionList() {
    final transactions = _filteredTransactions;

    if (transactions.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size: 80,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No transactions yet',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
      itemCount: transactions.length,
      itemBuilder: (context, index) =>
          _buildTransactionCard(transactions[index]),
    );
  }

  Widget _buildTransactionCard(HistoryEntry transaction) {
    final isDeposit = transaction.isGain;
    final color = isDeposit ? Colors.green : Colors.orange;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                isDeposit ? Icons.arrow_upward : Icons.arrow_downward,
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    transaction.detail,
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    transaction.dateLabel,
                    style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
            Text(
              '${isDeposit ? '+' : '-'}${transaction.pointsDelta.abs()}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
