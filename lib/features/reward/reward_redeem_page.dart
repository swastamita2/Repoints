import 'package:flutter/material.dart';

import '../../app/repoint_app.dart';
import '../../models/reward_item.dart';
import '../../utils/format_utils.dart';

class RewardRedeemPage extends StatelessWidget {
  final RewardItem reward;
  final int currentPoints;

  const RewardRedeemPage({
    super.key,
    required this.reward,
    required this.currentPoints,
  });

  @override
  Widget build(BuildContext context) {
    final remaining = currentPoints - reward.cost;
    final canRedeem = remaining >= 0;
    return Scaffold(
      backgroundColor: const Color(0xFFF6FBF3),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1F8E9),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        title: const Text(
          'Konfirmasi Penukaran',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w800),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 18,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9F7E4),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.account_balance_wallet,
                            color: Color(0xFF1F6B36),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Sisa Poin Anda',
                            style: TextStyle(
                              color: Color(0xFF1F6B36),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${FormatUtils.formatNumber(currentPoints)} Poin',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1F6B36),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 26),
              Text(
                'Anda yakin ingin menukar ini?',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              _RewardHighlightCard(reward: reward),
              const SizedBox(height: 20),
              _SummaryCard(cost: reward.cost, remaining: remaining),
              const SizedBox(height: 28),
              SizedBox(
                height: 54,
                child: ElevatedButton(
                  onPressed: canRedeem
                      ? () => Navigator.of(context).pop(true)
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: RePointApp.primaryGreen,
                    disabledBackgroundColor: Colors.grey.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Konfirmasi Penukaran',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 50,
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey.shade600, width: 1.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Batal',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RewardHighlightCard extends StatelessWidget {
  final RewardItem reward;

  const _RewardHighlightCard({required this.reward});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 14,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: reward.imagePath != null
                  ? Colors.white
                  : reward.accent.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(18),
            ),
            child: reward.imagePath != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      reward.imagePath!,
                      fit: BoxFit.cover,
                      width: 72,
                      height: 72,
                    ),
                  )
                : Icon(reward.icon, color: reward.accent, size: 38),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reward.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  reward.description,
                  style: const TextStyle(color: Colors.black54, fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  '${reward.cost} POIN',
                  style: const TextStyle(
                    color: RePointApp.primaryGreen,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final int cost;
  final int remaining;

  const _SummaryCard({required this.cost, required this.remaining});

  @override
  Widget build(BuildContext context) {
    final safeRemaining = remaining < 0 ? 0 : remaining;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ringkasan Penukaran',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 14),
          _summaryRow('Poin Terpakai', '- $cost Poin', Colors.red),
          const SizedBox(height: 12),
          _summaryRow(
            'Sisa Saldo',
            '$safeRemaining Poin',
            const Color(0xFF1F6B36),
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, String value, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: color,
          ),
        ),
      ],
    );
  }
}
