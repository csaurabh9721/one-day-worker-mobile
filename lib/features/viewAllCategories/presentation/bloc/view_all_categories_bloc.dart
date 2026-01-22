import 'package:flutter_bloc/flutter_bloc.dart';
import 'view_all_categories_event.dart';
import 'view_all_categories_state.dart';
import 'package:one_day_worker/features/viewAllCategories/domain/usecases/get_categories_usecase.dart';
import 'package:one_day_worker/features/viewAllCategories/domain/usecases/search_categories_usecase.dart';

class ViewAllCategoriesBloc
    extends Bloc<ViewAllCategoriesEvent, ViewAllCategoriesState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final SearchCategoriesUseCase searchCategoriesUseCase;

  ViewAllCategoriesBloc({
    required this.getCategoriesUseCase,
    required this.searchCategoriesUseCase,
  }) : super(ViewAllCategoriesInitial()) {
    on<LoadCategories>(_onLoadCategories);
    on<SearchCategories>(_onSearchCategories);
    on<ClearSearch>(_onClearSearch);
  }

  Future<void> _onLoadCategories(
    LoadCategories event,
    Emitter<ViewAllCategoriesState> emit,
  ) async {
    emit(ViewAllCategoriesLoading());
    try {
      final categories = await getCategoriesUseCase();
      emit(ViewAllCategoriesLoaded(
        categories: categories,
        filteredCategories: categories,
      ));
    } catch (e) {
      emit(ViewAllCategoriesError('Failed to load categories: ${e.toString()}'));
    }
  }

  Future<void> _onSearchCategories(
    SearchCategories event,
    Emitter<ViewAllCategoriesState> emit,
  ) async {
    if (state is ViewAllCategoriesLoaded) {
      final currentState = state as ViewAllCategoriesLoaded;
      
      if (event.query.isEmpty) {
        emit(currentState.copyWith(
          filteredCategories: currentState.categories,
          searchQuery: '',
        ));
        return;
      }

      try {
        final filteredCategories = await searchCategoriesUseCase(event.query);
        emit(currentState.copyWith(
          filteredCategories: filteredCategories,
          searchQuery: event.query,
        ));
      } catch (e) {
        emit(ViewAllCategoriesError('Failed to search categories: ${e.toString()}'));
      }
    }
  }

  Future<void> _onClearSearch(
    ClearSearch event,
    Emitter<ViewAllCategoriesState> emit,
  ) async {
    if (state is ViewAllCategoriesLoaded) {
      final currentState = state as ViewAllCategoriesLoaded;
      emit(currentState.copyWith(
        filteredCategories: currentState.categories,
        searchQuery: '',
      ));
    }
  }
}
