import '../models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<CategoryModel>> searchCategories(String query);
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  @override
  Future<List<CategoryModel>> getCategories() async {
    // Simulate API call delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Mock data - in real app, this would be an API call
    return [
      CategoryModel(
        id: '1',
        name: 'Repair',
        imageUrl: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=300&fit=crop',
        iconCodePoint: '0xe253', // Icons.car_repair
        gradientColors: [0.2196078431372549, 0.4196078431372549], // Blue shades
        workerCount: 156,
      ),
      CategoryModel(
        id: '2',
        name: 'Clean',
        imageUrl: 'https://images.unsplash.com/photo-1581578261546-f7d9030e5785?w=400&h=300&fit=crop',
        iconCodePoint: '0xe3b5', // Icons.cleaning_services
        gradientColors: [0.2196078431372549, 0.4196078431372549], // Green shades
        workerCount: 89,
      ),
      CategoryModel(
        id: '3',
        name: 'Plumb',
        imageUrl: 'https://images.unsplash.com/photo-1603796846097-bee99e4a601f?w=400&h=300&fit=crop',
        iconCodePoint: '0xe0f7', // Icons.plumbing
        gradientColors: [0.2196078431372549, 0.4196078431372549], // Cyan shades
        workerCount: 124,
      ),
      CategoryModel(
        id: '4',
        name: 'Carpenter',
        imageUrl: 'https://images.unsplash.com/photo-1581094794329-c8112a89af12?w=400&h=300&fit=crop',
        iconCodePoint: '0xe8b4', // Icons.carpenter
        gradientColors: [0.2196078431372549, 0.4196078431372549], // Brown shades
        workerCount: 67,
      ),
      CategoryModel(
        id: '5',
        name: 'Electrical',
        imageUrl: 'https://images.unsplash.com/photo-1581092918056-0c4c3acd3789?w=400&h=300&fit=crop',
        iconCodePoint: '0xe0f4', // Icons.electrical_services
        gradientColors: [0.2196078431372549, 0.4196078431372549], // Yellow shades
        workerCount: 203,
      ),
      CategoryModel(
        id: '6',
        name: 'Gardening',
        imageUrl: 'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=400&h=300&fit=crop',
        iconCodePoint: '0xe8a3', // Icons.account_tree
        gradientColors: [0.2196078431372549, 0.4196078431372549], // Light green shades
        workerCount: 45,
      ),
      CategoryModel(
        id: '7',
        name: 'Helper',
        imageUrl: 'https://images.unsplash.com/photo-1559027615-cd4628902d4a?w=400&h=300&fit=crop',
        iconCodePoint: '0xe914', // Icons.accessible_rounded
        gradientColors: [0.2196078431372549, 0.4196078431372549], // Purple shades
        workerCount: 178,
      ),
      CategoryModel(
        id: '8',
        name: 'Delivery',
        imageUrl: 'https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=400&h=300&fit=crop',
        iconCodePoint: '0xe915', // Icons.electric_bike_sharp
        gradientColors: [0.2196078431372549, 0.4196078431372549], // Orange shades
        workerCount: 92,
      ),
      CategoryModel(
        id: '9',
        name: 'Safety',
        imageUrl: 'https://images.unsplash.com/photo-1603796846097-bee99e4a601f?w=400&h=300&fit=crop',
        iconCodePoint: '0xe6e9', // Icons.safety_check
        gradientColors: [0.2196078431372549, 0.4196078431372549], // Red shades
        workerCount: 38,
      ),
      CategoryModel(
        id: '10',
        name: 'Others',
        imageUrl: 'https://images.unsplash.com/photo-1556761175-b413da4baf72?w=400&h=300&fit=crop',
        iconCodePoint: '0xe8fd', // Icons.help_outline
        gradientColors: [0.2196078431372549, 0.4196078431372549], // Grey shades
        workerCount: 156,
      ),
      CategoryModel(
        id: '11',
        name: 'Painting',
        imageUrl: 'https://images.unsplash.com/photo-1581094794329-c8112a89af12?w=400&h=300&fit=crop',
        iconCodePoint: '0xe243', // Icons.format_paint
        gradientColors: [0.2196078431372549, 0.4196078431372549], // Pink shades
        workerCount: 71,
      ),
      CategoryModel(
        id: '12',
        name: 'Construction',
        imageUrl: 'https://images.unsplash.com/photo-1518611012118-696072aa579a?w=400&h=300&fit=crop',
        iconCodePoint: '0xe8b7', // Icons.build
        gradientColors: [0.2196078431372549, 0.4196078431372549], // Indigo shades
        workerCount: 189,
      ),
    ];
  }

  @override
  Future<List<CategoryModel>> searchCategories(String query) async {
    final allCategories = await getCategories();
    
    if (query.isEmpty) {
      return allCategories;
    }
    
    return allCategories.where((category) {
      return category.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}
