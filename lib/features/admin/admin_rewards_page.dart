import 'package:flutter/material.dart';

import '../../app/app_state.dart';
import '../../app/repoint_app.dart';
import '../../models/reward_item.dart';

class AdminRewardsPage extends StatefulWidget {
  final AppState appState;

  const AdminRewardsPage({super.key, required this.appState});

  @override
  State<AdminRewardsPage> createState() => _AdminRewardsPageState();
}

class _AdminRewardsPageState extends State<AdminRewardsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        Expanded(child: _buildRewardList()),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Reward Management',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  '${widget.appState.rewards.length} rewards in catalog',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          FloatingActionButton(
            onPressed: _showAddRewardDialog,
            backgroundColor: RePointApp.primaryGreen,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Widget _buildRewardList() {
    final rewards = widget.appState.rewards;

    if (rewards.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.card_giftcard_outlined,
              size: 80,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No rewards yet',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
      itemCount: rewards.length,
      itemBuilder: (context, index) => _buildRewardCard(rewards[index]),
    );
  }

  Widget _buildRewardCard(RewardItem reward) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    reward.imagePath ?? 'asset/Katalog_reward/default.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image, size: 40),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reward.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        reward.description,
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.stars, size: 16, color: Colors.amber[700]),
                          const SizedBox(width: 4),
                          Text(
                            '${reward.cost} pts',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber[700],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Icon(
                            Icons.inventory,
                            size: 16,
                            color: Colors.blue[700],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Stock: ${reward.stock}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue[700],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: reward.isActive
                                  ? Colors.green.withValues(alpha: 0.1)
                                  : Colors.red.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              reward.isActive ? 'Active' : 'Inactive',
                              style: TextStyle(
                                fontSize: 12,
                                color: reward.isActive
                                    ? Colors.green[700]
                                    : Colors.red[700],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),
              onSelected: (value) {
                if (value == 'edit') {
                  _showEditRewardDialog(reward);
                } else if (value == 'toggle') {
                  _toggleRewardStatus(reward);
                } else if (value == 'delete') {
                  _deleteReward(reward);
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'edit',
                  child: Row(
                    children: [
                      Icon(Icons.edit, size: 20),
                      SizedBox(width: 8),
                      Text('Edit'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'toggle',
                  child: Row(
                    children: [
                      Icon(
                        reward.isActive
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(reward.isActive ? 'Deactivate' : 'Activate'),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete, size: 20, color: Colors.red),
                      SizedBox(width: 8),
                      Text('Delete', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showAddRewardDialog() {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final imagePathController = TextEditingController();
    final costController = TextEditingController();
    final stockController = TextEditingController(text: '999');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Reward'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: imagePathController,
                decoration: const InputDecoration(
                  labelText: 'Image Path (asset/...)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: costController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Point Cost',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: stockController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Stock',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final title = titleController.text.trim();
              final description = descriptionController.text.trim();
              final imagePath = imagePathController.text.trim();
              final cost = int.tryParse(costController.text) ?? 0;
              final stock = int.tryParse(stockController.text) ?? 999;

              if (title.isEmpty ||
                  description.isEmpty ||
                  imagePath.isEmpty ||
                  cost <= 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please fill all fields correctly'),
                  ),
                );
                return;
              }

              final newReward = RewardItem(
                title: title,
                description: description,
                imagePath: imagePath,
                cost: cost,
                icon: Icons.card_giftcard,
                accent: RePointApp.primaryGreen,
                stock: stock,
              );

              widget.appState.addReward(newReward);
              setState(() {});
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Reward added successfully')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: RePointApp.primaryGreen,
              foregroundColor: Colors.white,
            ),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showEditRewardDialog(RewardItem reward) {
    final titleController = TextEditingController(text: reward.title);
    final descriptionController = TextEditingController(
      text: reward.description,
    );
    final imagePathController = TextEditingController(text: reward.imagePath);
    final costController = TextEditingController(text: reward.cost.toString());
    final stockController = TextEditingController(
      text: reward.stock.toString(),
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Reward'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: imagePathController,
                decoration: const InputDecoration(
                  labelText: 'Image Path (asset/...)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: costController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Point Cost',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: stockController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Stock',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final title = titleController.text.trim();
              final description = descriptionController.text.trim();
              final imagePath = imagePathController.text.trim();
              final cost = int.tryParse(costController.text) ?? 0;
              final stock = int.tryParse(stockController.text) ?? 0;

              if (title.isEmpty ||
                  description.isEmpty ||
                  imagePath.isEmpty ||
                  cost <= 0 ||
                  stock < 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please fill all fields correctly'),
                  ),
                );
                return;
              }

              final updatedReward = reward.copyWith(
                title: title,
                description: description,
                imagePath: imagePath,
                cost: cost,
                stock: stock,
              );

              widget.appState.updateReward(updatedReward);
              setState(() {});
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Reward updated successfully')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: RePointApp.primaryGreen,
              foregroundColor: Colors.white,
            ),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _toggleRewardStatus(RewardItem reward) {
    final updatedReward = reward.copyWith(isActive: !reward.isActive);
    widget.appState.updateReward(updatedReward);
    setState(() {});
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          updatedReward.isActive ? 'Reward activated' : 'Reward deactivated',
        ),
      ),
    );
  }

  void _deleteReward(RewardItem reward) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Reward'),
        content: Text('Are you sure you want to delete "${reward.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              widget.appState.deleteReward(reward.id);
              setState(() {});
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Reward deleted')));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
