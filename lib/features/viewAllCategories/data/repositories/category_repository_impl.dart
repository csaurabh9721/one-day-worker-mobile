import '../../domain/entities/category.dart';
import '../../domain/repositories/category_repository.dart';
import '../datasources/category_remote_datasource.dart';
import '../models/category_model.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Category>> getCategories() async {
    try {
      final categoryModels = await remoteDataSource.getCategories();
      return categoryModels.map((model) => _mapToEntity(model)).toList();
    } catch (e) {
      throw Exception('Failed to get categories: $e');
    }
  }

  @override
  Future<List<Category>> searchCategories(String query) async {
    try {
      final categoryModels = await remoteDataSource.searchCategories(query);
      return categoryModels.map((model) => _mapToEntity(model)).toList();
    } catch (e) {
      throw Exception('Failed to search categories: $e');
    }
  }

  Category _mapToEntity(CategoryModel model) {
    return Category(
      id: model.id,
      name: model.name,
      imageUrl: model.imageUrl,
      iconCodePoint: model.iconCodePoint,
      gradientColors: model.gradientColors,
      workerCount: model.workerCount,
      isAvailable: model.isAvailable,
    );
  }
}
