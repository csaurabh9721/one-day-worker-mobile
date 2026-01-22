
abstract class ViewAllCategoriesEvent  {
  const ViewAllCategoriesEvent();

}

class LoadCategories extends ViewAllCategoriesEvent {}

class SearchCategories extends ViewAllCategoriesEvent {
  final String query;

  const SearchCategories(this.query);


}

class ClearSearch extends ViewAllCategoriesEvent {}
