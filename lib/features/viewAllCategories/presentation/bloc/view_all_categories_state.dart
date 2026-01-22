import '../../domain/entities/category.dart';

abstract class ViewAllCategoriesState  {
  const ViewAllCategoriesState();


}

class ViewAllCategoriesInitial extends ViewAllCategoriesState {}

class ViewAllCategoriesLoading extends ViewAllCategoriesState {}

class ViewAllCategoriesLoaded extends ViewAllCategoriesState {
  final List<Category> categories;
  final List<Category> filteredCategories;
  final String searchQuery;

  const ViewAllCategoriesLoaded({
    required this.categories,
    required this.filteredCategories,
    this.searchQuery = '',
  });

  @override
  List<Object> get props => [categories, filteredCategories, searchQuery];

  ViewAllCategoriesLoaded copyWith({
    List<Category>? categories,
    List<Category>? filteredCategories,
    String? searchQuery,
  }) {
    return ViewAllCategoriesLoaded(
      categories: categories ?? this.categories,
      filteredCategories: filteredCategories ?? this.filteredCategories,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

class ViewAllCategoriesError extends ViewAllCategoriesState {
  final String message;

  const ViewAllCategoriesError(this.message);

  @override
  List<Object> get props => [message];
}
