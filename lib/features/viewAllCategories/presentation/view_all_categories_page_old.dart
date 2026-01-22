import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/routes/route_names.dart';
import '../../../core/theme/app_color.dart';

class ViewAllCategoriesPage extends StatefulWidget {
  const ViewAllCategoriesPage({super.key});

  @override
  State<ViewAllCategoriesPage> createState() => _ViewAllCategoriesPageState();
}

class _ViewAllCategoriesPageState extends State<ViewAllCategoriesPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool _isSearching = false;
  List<Map<String, dynamic>> _filteredCategories = [];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (_isSearching) {
        _searchFocusNode.requestFocus();
      } else {
        _searchController.clear();
        _searchFocusNode.unfocus();
      }
    });
  }

  void _filterCategories(String query, List<Map<String, dynamic>> allCategories) {
    setState(() {
      if (query.isEmpty) {
        _filteredCategories = allCategories;
      } else {
        _filteredCategories = allCategories.where((category) {
          final name = category['name'].toString().toLowerCase();
          final searchQuery = query.toLowerCase();
          return name.contains(searchQuery);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'icon': Icons.car_repair,
        'name': 'Repair',
        'image': 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=300&fit=crop',
        'color': Colors.blue.shade100,
        'gradient': [Colors.blue.shade400, Colors.blue.shade600],
        'count': '156',
      },
      {
        'icon': Icons.cleaning_services,
        'name': 'Clean',
        'image': 'https://images.unsplash.com/photo-1581578261546-f7d9030e5785?w=400&h=300&fit=crop',
        'color': Colors.green.shade100,
        'gradient': [Colors.green.shade400, Colors.green.shade600],
        'count': '89',
      },
      {
        'icon': Icons.plumbing,
        'name': 'Plumb',
        'image': 'https://images.unsplash.com/photo-1603796846097-bee99e4a601f?w=400&h=300&fit=crop',
        'color': Colors.cyan.shade100,
        'gradient': [Colors.cyan.shade400, Colors.cyan.shade600],
        'count': '124',
      },
      {
        'icon': Icons.carpenter,
        'name': 'Carpenter',
        'image': 'https://images.unsplash.com/photo-1581094794329-c8112a89af12?w=400&h=300&fit=crop',
        'color': Colors.brown.shade100,
        'gradient': [Colors.brown.shade400, Colors.brown.shade600],
        'count': '67',
      },
      {
        'icon': Icons.electrical_services,
        'name': 'Electrical',
        'image': 'https://images.unsplash.com/photo-1581092918056-0c4c3acd3789?w=400&h=300&fit=crop',
        'color': Colors.yellow.shade100,
        'gradient': [Colors.yellow.shade400, Colors.yellow.shade600],
        'count': '203',
      },
      {
        'icon': Icons.account_tree,
        'name': 'Gardening',
        'image': 'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=400&h=300&fit=crop',
        'color': Colors.lightGreen.shade100,
        'gradient': [Colors.lightGreen.shade400, Colors.lightGreen.shade600],
        'count': '45',
      },
      {
        'icon': Icons.accessible_rounded,
        'name': 'Helper',
        'image': 'https://images.unsplash.com/photo-1559027615-cd4628902d4a?w=400&h=300&fit=crop',
        'color': Colors.purple.shade100,
        'gradient': [Colors.purple.shade400, Colors.purple.shade600],
        'count': '178',
      },
      {
        'icon': Icons.electric_bike_sharp,
        'name': 'Delivery',
        'image': 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=400&h=300&fit=crop',
        'color': Colors.orange.shade100,
        'gradient': [Colors.orange.shade400, Colors.orange.shade600],
        'count': '92',
      },
      {
        'icon': Icons.safety_check,
        'name': 'Safety',
        'image': 'https://images.unsplash.com/photo-1603796846097-bee99e4a601f?w=400&h=300&fit=crop',
        'color': Colors.red.shade100,
        'gradient': [Colors.red.shade400, Colors.red.shade600],
        'count': '38',
      },
      {
        'icon': Icons.help_outline,
        'name': 'Others',
        'image': 'https://images.unsplash.com/photo-1556761175-b413da4baf72?w=400&h=300&fit=crop',
        'color': Colors.grey.shade100,
        'gradient': [Colors.grey.shade400, Colors.grey.shade600],
        'count': '156',
      },
      {
        'icon': Icons.format_paint,
        'name': 'Painting',
        'image': 'https://images.unsplash.com/photo-1581094794329-c8112a89af12?w=400&h=300&fit=crop',
        'color': Colors.pink.shade100,
        'gradient': [Colors.pink.shade400, Colors.pink.shade600],
        'count': '71',
      },
      {
        'icon': Icons.build,
        'name': 'Construction',
        'image': 'https://images.unsplash.com/photo-1518611012118-696072aa579a?w=400&h=300&fit=crop',
        'color': Colors.indigo.shade100,
        'gradient': [Colors.indigo.shade400, Colors.indigo.shade600],
        'count': '189',
      },
    ];

    // Initialize filtered categories
    if (_filteredCategories.isEmpty) {
      _filteredCategories = categories;
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: _isSearching ? 200 : 120,
                floating: false,
                pinned: true,
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                flexibleSpace: FlexibleSpaceBar(
                  title: _isSearching ? null : Text(
                    'All Categories',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.primary,
                          AppColors.secondary,
                        ],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: -50,
                          top: -50,
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white.withValues(alpha: 0.1),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 20,
                          top: 60,
                          child: Icon(
                            Icons.category,
                            size: 100,
                            color: AppColors.white.withValues(alpha: 0.2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                leading: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: Icon(_isSearching ? Icons.close : Icons.arrow_back_ios_new),
                    onPressed: () {
                      if (_isSearching) {
                        _toggleSearch();
                      } else {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
                actions: [
                  if (!_isSearching)
                    Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: _toggleSearch,
                      ),
                    ),
                ],
                bottom: _isSearching
                    ? PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _searchController,
                        focusNode: _searchFocusNode,
                        onChanged: (query) => _filterCategories(query, categories),
                        decoration: InputDecoration(
                          hintText: 'Search categories...',
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              _filterCategories('', categories);
                            },
                          )
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: AppColors.text,
                        ),
                      ),
                    ),
                  ),
                )
                    : null,
              ),
              SliverToBoxAdapter(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!_isSearching) ...[
                            Text(
                              'Choose a Service',
                              style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.text,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Select from our wide range of professional services',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(height: 24),
                          ] else if (_filteredCategories.isEmpty) ...[
                            const SizedBox(height: 20),
                            Center(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.search_off,
                                    size: 64,
                                    color: Colors.grey.shade400,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'No categories found',
                                    style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Try searching with different keywords',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                          ] else ...[
                            const SizedBox(height: 20),
                            Text(
                              '${_filteredCategories.length} ${_filteredCategories.length == 1 ? 'category' : 'categories'} found',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.text,
                              ),
                            ),
                            const SizedBox(height: 24),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (_filteredCategories.isNotEmpty)
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.85,
                    ),
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        final category = _filteredCategories[index];
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300 + (index * 50)),
                          curve: Curves.easeOutCubic,
                          child: _buildCategoryCard(context, category, index),
                        );
                      },
                      childCount: _filteredCategories.length,
                    ),
                  ),
                ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, Map<String, dynamic> category, int index) {
    return Hero(
      tag: 'category_$index',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              RouteNames.workerList,
              arguments: {
                'categoryName': category['name'],
                'categoryIcon': category['icon'],
                'categoryGradient': category['gradient'],
              },
            );
            // Navigator.push(
            //   context,
            //   PageRouteBuilder(
            //     pageBuilder: (context, animation, secondaryAnimation) =>
            //         FadeTransition(
            //           opacity: animation,
            //           child: CategoryDetailPage(
            //             category: category,
            //             heroTag: 'category_$index',
            //           ),
            //         ),
            //     transitionDuration: const Duration(milliseconds: 300),
            //   ),
            // );
          },
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    category['image'],
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: category['gradient'],
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            category['icon'],
                            size: 50,
                            color: AppColors.white.withValues(alpha: 0.8),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.1),
                          Colors.black.withValues(alpha: 0.7),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(alpha: 0.95),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.people,
                          size: 12,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          category['count'],
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.white.withValues(alpha: 0.9),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          category['icon'],
                          size: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        category['name'],
                        style: GoogleFonts.inter(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black.withValues(alpha: 0.5),
                              offset: const Offset(0, 1),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            'Available Now',
                            style: GoogleFonts.inter(
                              color: AppColors.white.withValues(alpha: 0.9),
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.circle,
                            color: Colors.green.shade300,
                            size: 6,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryDetailPage extends StatelessWidget {
  final Map<String, dynamic> category;
  final String heroTag;

  const CategoryDetailPage({
    super.key,
    required this.category,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: heroTag,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: category['gradient'],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  category['icon'],
                  size: 80,
                  color: AppColors.white,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              category['name'],
              style: GoogleFonts.inter(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${category['count']} professionals available',
              style: GoogleFonts.inter(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Finding ${category['name']} professionals...'),
                      backgroundColor: AppColors.primary,
                    ),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.search),
                    const SizedBox(width: 8),
                    Text(
                      'Find Professionals',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}