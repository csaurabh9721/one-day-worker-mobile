import '../entities/category.dart';
import '../repositories/category_repository.dart';

class SearchCategoriesUseCase {
  final CategoryRepository repository;

  SearchCategoriesUseCase({required this.repository});

  Future<List<Category>> call(String query) async {
    return await repository.searchCategories(query);
  }
}
