import 'package:flutter/material.dart';

import '../../app/repoint_app.dart';
import '../../models/edukasi_item.dart';
import 'education_detail_page.dart';

class EducationPage extends StatefulWidget {
  final List<EdukasiItem> items;

  const EducationPage({super.key, required this.items});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';
  bool _showOnlyFavorites = false;
  EdukasiCategory? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<EdukasiItem> get _filteredItems {
    return widget.items.where((item) {
      // Filter by search query
      final matchesSearch =
          _searchQuery.isEmpty ||
          item.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          item.description.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          item.tags.any(
            (tag) => tag.toLowerCase().contains(_searchQuery.toLowerCase()),
          );

      // Filter by favorites
      final matchesFavorite = !_showOnlyFavorites || item.isFavorite;

      // Filter by category
      final matchesCategory =
          _selectedCategory == null || item.category == _selectedCategory;

      // Filter by tab
      bool matchesTab = true;
      switch (_tabController.index) {
        case 0: // Semua
          matchesTab = true;
          break;
        case 1: // Belum Dibaca
          matchesTab = !item.isRead;
          break;
        case 2: // Sudah Dibaca
          matchesTab = item.isRead;
          break;
      }

      return matchesSearch && matchesFavorite && matchesCategory && matchesTab;
    }).toList();
  }

  int get _unreadCount => widget.items.where((item) => !item.isRead).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FBF3),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Stats
                  Row(
                    children: [
                      Container(
                        width: 4,
                        height: 28,
                        decoration: BoxDecoration(
                          color: RePointApp.primaryGreen,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Edukasi',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: Colors.black87,
                        ),
                      ),
                      const Spacer(),
                      // Stats
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: RePointApp.primaryGreen.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.article,
                              size: 16,
                              color: RePointApp.primaryGreen,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '${widget.items.length}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: RePointApp.primaryGreen,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Search Bar
                  TextField(
                    onChanged: (value) => setState(() => _searchQuery = value),
                    decoration: InputDecoration(
                      hintText: 'Cari artikel, tips, atau informasi...',
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: RePointApp.primaryGreen,
                      ),
                      suffixIcon: _searchQuery.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear, size: 20),
                              onPressed: () =>
                                  setState(() => _searchQuery = ''),
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
                  const SizedBox(height: 12),

                  // Filter Chips
                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      children: [
                        // Favorite filter
                        Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: FilterChip(
                            label: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  _showOnlyFavorites
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  size: 12,
                                  color: _showOnlyFavorites
                                      ? Colors.white
                                      : RePointApp.primaryGreen,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  'Favorit',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11,
                                    color: _showOnlyFavorites
                                        ? Colors.white
                                        : RePointApp.primaryGreen,
                                  ),
                                ),
                              ],
                            ),
                            selected: _showOnlyFavorites,
                            onSelected: (selected) {
                              setState(() => _showOnlyFavorites = selected);
                            },
                            backgroundColor: Colors.white,
                            selectedColor: RePointApp.primaryGreen,
                            side: BorderSide(
                              color: RePointApp.primaryGreen,
                              width: 1.2,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 4,
                            ),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                          ),
                        ),
                        // Category filters
                        ..._buildCategoryFilters(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Tabs
            Container(
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                onTap: (_) => setState(() {}),
                labelColor: RePointApp.primaryGreen,
                unselectedLabelColor: Colors.grey,
                indicatorColor: RePointApp.primaryGreen,
                indicatorWeight: 3,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
                tabs: [
                  Tab(text: 'Semua (${widget.items.length})'),
                  Tab(text: 'Belum Dibaca ($_unreadCount)'),
                  Tab(
                    text:
                        'Sudah Dibaca (${widget.items.length - _unreadCount})',
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildArticleList(),
                  _buildArticleList(),
                  _buildArticleList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCategoryFilters() {
    final categoryData = {
      EdukasiCategory.daurUlang: {
        'icon': Icons.recycling,
        'color': const Color(0xFF4CAF50),
      },
      EdukasiCategory.lingkungan: {
        'icon': Icons.public,
        'color': const Color(0xFF2196F3),
      },
      EdukasiCategory.tips: {
        'icon': Icons.lightbulb,
        'color': const Color(0xFFFF9800),
      },
      EdukasiCategory.inovasi: {
        'icon': Icons.science,
        'color': const Color(0xFF9C27B0),
      },
      EdukasiCategory.komunitas: {
        'icon': Icons.groups,
        'color': const Color(0xFFE91E63),
      },
    };

    final categoryNames = {
      EdukasiCategory.daurUlang: 'Daur Ulang',
      EdukasiCategory.lingkungan: 'Lingkungan',
      EdukasiCategory.tips: 'Tips & Trik',
      EdukasiCategory.inovasi: 'Inovasi',
      EdukasiCategory.komunitas: 'Komunitas',
    };

    return EdukasiCategory.values.map((category) {
      final isSelected = _selectedCategory == category;
      final data = categoryData[category]!;
      final categoryColor = data['color'] as Color;
      final categoryIcon = data['icon'] as IconData;
      final categoryName = categoryNames[category]!;

      return Padding(
        padding: const EdgeInsets.only(right: 6),
        child: FilterChip(
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                categoryIcon,
                size: 12,
                color: isSelected ? Colors.white : categoryColor,
              ),
              const SizedBox(width: 3),
              Text(
                categoryName,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                  color: isSelected ? Colors.white : categoryColor,
                ),
              ),
            ],
          ),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              _selectedCategory = selected ? category : null;
            });
          },
          backgroundColor: Colors.white,
          selectedColor: categoryColor,
          side: BorderSide(color: categoryColor, width: 1.2),
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        ),
      );
    }).toList();
  }

  Widget _buildArticleList() {
    final filtered = _filteredItems;

    if (filtered.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 80, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            Text(
              'Tidak ada artikel ditemukan',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Coba ubah filter pencarian',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        final article = filtered[index];
        return _ArticleCard(
          article: article,
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EducationDetailPage(
                  article: article,
                  onFavoriteToggle: () => setState(() {}),
                ),
              ),
            );
            setState(() {}); // Refresh to show read status
          },
          onFavoriteToggle: () => setState(() {
            article.isFavorite = !article.isFavorite;
          }),
        );
      },
    );
  }
}

class _ArticleCard extends StatelessWidget {
  final EdukasiItem article;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  const _ArticleCard({
    required this.article,
    required this.onTap,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image/Icon
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [
                        article.categoryColor.withValues(alpha: 0.2),
                        article.categoryColor.withValues(alpha: 0.4),
                      ],
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      article.imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          article.icon,
                          size: 40,
                          color: article.categoryColor,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: article.categoryColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          article.categoryName,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: article.categoryColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Title
                      Text(
                        article.title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      // Description
                      Text(
                        article.description,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                          height: 1.4,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      // Footer
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: Colors.grey.shade500,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${article.readMinutes} mnt',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          if (article.isRead) ...[
                            const SizedBox(width: 12),
                            Icon(
                              Icons.check_circle,
                              size: 14,
                              color: RePointApp.primaryGreen,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'Sudah dibaca',
                              style: TextStyle(
                                fontSize: 12,
                                color: RePointApp.primaryGreen,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
                // Favorite button
                IconButton(
                  icon: Icon(
                    article.isFavorite ? Icons.bookmark : Icons.bookmark_border,
                    color: article.isFavorite
                        ? RePointApp.primaryGreen
                        : Colors.grey.shade400,
                  ),
                  onPressed: onFavoriteToggle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
