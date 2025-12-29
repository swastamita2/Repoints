import 'package:flutter/material.dart';

import '../../app/app_state.dart';
import '../../app/repoint_app.dart';
import '../../models/edukasi_item.dart';

class AdminEducationPage extends StatefulWidget {
  final AppState appState;

  const AdminEducationPage({super.key, required this.appState});

  @override
  State<AdminEducationPage> createState() => _AdminEducationPageState();
}

class _AdminEducationPageState extends State<AdminEducationPage> {
  String _filterCategory = 'All';
  String _searchQuery = '';

  List<EdukasiItem> get _filteredEducation {
    var items = widget.appState.educationItems;

    // Filter by search query
    if (_searchQuery.isNotEmpty) {
      items = items.where((item) {
        final matchesSearch =
            item.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            item.description.toLowerCase().contains(
              _searchQuery.toLowerCase(),
            ) ||
            item.tags.any(
              (tag) => tag.toLowerCase().contains(_searchQuery.toLowerCase()),
            );
        return matchesSearch;
      }).toList();
    }

    // Filter by category
    if (_filterCategory != 'All') {
      items = items.where((e) => e.categoryName == _filterCategory).toList();
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        _buildFilterBar(),
        Expanded(child: _buildEducationList()),
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
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kelola Konten Edukasi',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${_filteredEducation.length} dari ${widget.appState.educationItems.length} artikel',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              FloatingActionButton(
                onPressed: _showAddEducationDialog,
                backgroundColor: RePointApp.primaryGreen,
                child: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Search Bar
          TextField(
            onChanged: (value) => setState(() => _searchQuery = value),
            decoration: InputDecoration(
              hintText: 'Cari judul, deskripsi, atau tag...',
              hintStyle: TextStyle(color: Colors.grey.shade500),
              prefixIcon: const Icon(
                Icons.search,
                color: RePointApp.primaryGreen,
              ),
              suffixIcon: _searchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, size: 20),
                      onPressed: () => setState(() => _searchQuery = ''),
                    )
                  : null,
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
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
            _buildFilterChip('Daur Ulang'),
            _buildFilterChip('Lingkungan'),
            _buildFilterChip('Tips & Trik'),
            _buildFilterChip('Inovasi'),
            _buildFilterChip('Komunitas'),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String category) {
    final isSelected = _filterCategory == category;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(category),
        selected: isSelected,
        onSelected: (selected) {
          setState(() => _filterCategory = category);
        },
        selectedColor: RePointApp.primaryGreen.withValues(alpha: 0.2),
        checkmarkColor: RePointApp.primaryGreen,
      ),
    );
  }

  Widget _buildEducationList() {
    final items = _filteredEducation;

    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.school_outlined, size: 80, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'Belum ada konten edukasi',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
      itemCount: items.length,
      itemBuilder: (context, index) => _buildEducationCard(items[index]),
    );
  }

  Widget _buildEducationCard(EdukasiItem item) {
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
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: item.categoryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(item.icon, size: 40, color: item.categoryColor),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.description,
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: item.categoryColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              item.categoryName,
                              style: TextStyle(
                                fontSize: 11,
                                color: item.categoryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(Icons.access_time, size: 14, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(
                            '${item.readMinutes} min',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
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
                  _showEditEducationDialog(item);
                } else if (value == 'delete') {
                  _deleteEducation(item);
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

  void _showAddEducationDialog() {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final contentController = TextEditingController();
    final minutesController = TextEditingController(text: '5');
    EdukasiCategory selectedCategory = EdukasiCategory.daurUlang;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Tambah Konten Edukasi'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Judul',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Deskripsi Singkat',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: contentController,
                  decoration: const InputDecoration(
                    labelText: 'Konten Lengkap',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 5,
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<EdukasiCategory>(
                  initialValue: selectedCategory,
                  decoration: const InputDecoration(
                    labelText: 'Kategori',
                    border: OutlineInputBorder(),
                  ),
                  items: EdukasiCategory.values.map((cat) {
                    return DropdownMenuItem(
                      value: cat,
                      child: Text(_getCategoryName(cat)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setDialogState(() => selectedCategory = value);
                    }
                  },
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: minutesController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Waktu Baca (menit)',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text.trim();
                final description = descriptionController.text.trim();
                final content = contentController.text.trim();
                final minutes = int.tryParse(minutesController.text) ?? 5;

                if (title.isEmpty || description.isEmpty || content.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Mohon isi semua field')),
                  );
                  return;
                }

                final newItem = EdukasiItem(
                  id: 'edu-${DateTime.now().millisecondsSinceEpoch}',
                  title: title,
                  description: description,
                  fullContent: content,
                  icon: _getCategoryIcon(selectedCategory),
                  imagePath: 'asset/edukasi_placeholder.png',
                  category: selectedCategory,
                  readMinutes: minutes,
                  publishDate: DateTime.now(),
                );

                widget.appState.addEducation(newItem);
                setState(() {});
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Konten berhasil ditambahkan')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: RePointApp.primaryGreen,
                foregroundColor: Colors.white,
              ),
              child: const Text('Tambah'),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditEducationDialog(EdukasiItem item) {
    final titleController = TextEditingController(text: item.title);
    final descriptionController = TextEditingController(text: item.description);
    final contentController = TextEditingController(text: item.fullContent);
    final minutesController = TextEditingController(
      text: item.readMinutes.toString(),
    );
    EdukasiCategory selectedCategory = item.category;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Edit Konten Edukasi'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Judul',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Deskripsi Singkat',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: contentController,
                  decoration: const InputDecoration(
                    labelText: 'Konten Lengkap',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 5,
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<EdukasiCategory>(
                  initialValue: selectedCategory,
                  decoration: const InputDecoration(
                    labelText: 'Kategori',
                    border: OutlineInputBorder(),
                  ),
                  items: EdukasiCategory.values.map((cat) {
                    return DropdownMenuItem(
                      value: cat,
                      child: Text(_getCategoryName(cat)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setDialogState(() => selectedCategory = value);
                    }
                  },
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: minutesController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Waktu Baca (menit)',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text.trim();
                final description = descriptionController.text.trim();
                final content = contentController.text.trim();
                final minutes = int.tryParse(minutesController.text) ?? 5;

                if (title.isEmpty || description.isEmpty || content.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Mohon isi semua field')),
                  );
                  return;
                }

                final updatedItem = EdukasiItem(
                  id: item.id,
                  title: title,
                  description: description,
                  fullContent: content,
                  icon: _getCategoryIcon(selectedCategory),
                  imagePath: item.imagePath,
                  category: selectedCategory,
                  readMinutes: minutes,
                  publishDate: item.publishDate,
                  isFavorite: item.isFavorite,
                  isRead: item.isRead,
                );

                widget.appState.updateEducation(updatedItem);
                setState(() {});
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Konten berhasil diupdate')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: RePointApp.primaryGreen,
                foregroundColor: Colors.white,
              ),
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteEducation(EdukasiItem item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Konten'),
        content: Text('Apakah Anda yakin ingin menghapus "${item.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              widget.appState.deleteEducation(item.id);
              setState(() {});
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Konten berhasil dihapus')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }

  String _getCategoryName(EdukasiCategory category) {
    switch (category) {
      case EdukasiCategory.daurUlang:
        return 'Daur Ulang';
      case EdukasiCategory.lingkungan:
        return 'Lingkungan';
      case EdukasiCategory.tips:
        return 'Tips & Trik';
      case EdukasiCategory.inovasi:
        return 'Inovasi';
      case EdukasiCategory.komunitas:
        return 'Komunitas';
    }
  }

  IconData _getCategoryIcon(EdukasiCategory category) {
    switch (category) {
      case EdukasiCategory.daurUlang:
        return Icons.recycling;
      case EdukasiCategory.lingkungan:
        return Icons.eco;
      case EdukasiCategory.tips:
        return Icons.lightbulb;
      case EdukasiCategory.inovasi:
        return Icons.science;
      case EdukasiCategory.komunitas:
        return Icons.groups;
    }
  }
}
