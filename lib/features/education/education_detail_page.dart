import 'package:flutter/material.dart';

import '../../app/repoint_app.dart';
import '../../models/edukasi_item.dart';
import '../../utils/format_utils.dart';

class EducationDetailPage extends StatefulWidget {
  final EdukasiItem article;
  final VoidCallback? onFavoriteToggle;

  const EducationDetailPage({
    super.key,
    required this.article,
    this.onFavoriteToggle,
  });

  @override
  State<EducationDetailPage> createState() => _EducationDetailPageState();
}

class _EducationDetailPageState extends State<EducationDetailPage>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;
  bool _showTitle = false;
  double _readProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scrollController.addListener(_onScroll);

    // Mark as read when opened
    if (!widget.article.isRead) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            widget.article.isRead = true;
          });
        }
      });
    }
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    final maxScroll = _scrollController.position.maxScrollExtent;

    // Show title in appbar when scrolled past image
    if (offset > 200 && !_showTitle) {
      setState(() => _showTitle = true);
      _animationController.forward();
    } else if (offset <= 200 && _showTitle) {
      setState(() => _showTitle = false);
      _animationController.reverse();
    }

    // Calculate read progress
    if (maxScroll > 0) {
      setState(() {
        _readProgress = (offset / maxScroll).clamp(0.0, 1.0);
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Content
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              // Hero Image Header
              SliverAppBar(
                expandedHeight: 280,
                pinned: true,
                backgroundColor: RePointApp.primaryGreen,
                leading: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.9),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black87),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                actions: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.9),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        widget.article.isFavorite
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        color: widget.article.isFavorite
                            ? RePointApp.primaryGreen
                            : Colors.black87,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.article.isFavorite =
                              !widget.article.isFavorite;
                        });
                        widget.onFavoriteToggle?.call();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              widget.article.isFavorite
                                  ? 'Ditambahkan ke bookmark'
                                  : 'Dihapus dari bookmark',
                            ),
                            duration: const Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  title: _showTitle
                      ? FadeTransition(
                          opacity: _animationController,
                          child: Text(
                            widget.article.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      : null,
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        widget.article.imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: widget.article.categoryColor.withValues(
                              alpha: 0.3,
                            ),
                            child: Icon(
                              widget.article.icon,
                              size: 80,
                              color: widget.article.categoryColor,
                            ),
                          );
                        },
                      ),
                      // Gradient overlay
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.7),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Article Content
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category Badge
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: widget.article.categoryColor.withValues(
                                alpha: 0.15,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  widget.article.icon,
                                  size: 16,
                                  color: widget.article.categoryColor,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  widget.article.categoryName,
                                  style: TextStyle(
                                    color: widget.article.categoryColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.access_time,
                            size: 16,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${widget.article.readMinutes} menit',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Title
                      Text(
                        widget.article.title,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: Colors.black87,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Metadata
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: RePointApp.primaryGreen.withValues(
                              alpha: 0.2,
                            ),
                            child: const Icon(
                              Icons.article,
                              size: 16,
                              color: RePointApp.primaryGreen,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'RePoints Team',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                FormatUtils.formatDate(
                                  widget.article.publishDate,
                                ),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Description
                      Text(
                        widget.article.description,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                          height: 1.6,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Divider
                      Container(height: 1, color: Colors.grey.shade300),
                      const SizedBox(height: 24),

                      // Full Content
                      Text(
                        widget.article.fullContent,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          height: 1.8,
                          letterSpacing: 0.2,
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Tags
                      if (widget.article.tags.isNotEmpty) ...[
                        const Text(
                          'Tags',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: widget.article.tags.map((tag) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Text(
                                '#$tag',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 32),
                      ],

                      // Share Section
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: RePointApp.primaryGreen.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.share,
                              color: RePointApp.primaryGreen,
                              size: 28,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Bagikan Artikel Ini',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Sebarkan pengetahuan ke teman-temanmu',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Fitur share akan segera hadir!',
                                    ),
                                    duration: Duration(seconds: 2),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              },
                              icon: const Icon(Icons.arrow_forward_ios),
                              color: RePointApp.primaryGreen,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Reading Progress Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: LinearProgressIndicator(
              value: _readProgress,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(
                RePointApp.primaryGreen,
              ),
              minHeight: 3,
            ),
          ),
        ],
      ),
    );
  }
}
