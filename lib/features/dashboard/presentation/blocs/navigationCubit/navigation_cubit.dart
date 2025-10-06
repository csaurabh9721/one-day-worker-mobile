import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation_state.dart';

final class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(0));

  void changeIndex(int index) {
    emit(NavigationState(index));
  }
}
