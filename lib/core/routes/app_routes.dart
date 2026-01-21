import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_day_worker/core/routes/route_names.dart';
import 'package:one_day_worker/features/splash/presentation/page/splash_page.dart';

import '../../features/dashboard/presentation/blocs/navigationCubit/navigation_cubit.dart';
import '../../features/dashboard/presentation/page/dashboard_page.dart';
import '../../features/initial/presentation/initial_page.dart';
import '../../features/signIn/presentation/sign_in_page.dart';
import '../../features/signUp/presentation/sign_up_page.dart';
import '../../features/viewAllCategories/presentation/view_all_categories_page.dart';
import '../../features/workerList/presentation/worker_list_page.dart';
import '../theme/app_color.dart';

final class AppRoutes {
  static Route<dynamic>? routes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case RouteNames.initialPage:
        return MaterialPageRoute(builder: (context) => const InitialPage());
      case RouteNames.signUpPage:
        return MaterialPageRoute(builder: (context) => const SignUpPage());
      case RouteNames.signInPage:
        return MaterialPageRoute(builder: (context) => const SignInPage());
      case RouteNames.dashboard:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => NavigationCubit(),
            child: const DashboardPage(),
          ),
        );
      case RouteNames.viewAllCategories:
        return MaterialPageRoute(builder: (context) => const ViewAllCategoriesPage());
      case RouteNames.workerList:
        return MaterialPageRoute(builder: (context) {
          final args = settings.arguments as Map<String, dynamic>?;
          return WorkerListPage(
            categoryName: args?['categoryName'] ?? 'Workers',
            categoryIcon: args?['categoryIcon'] ?? 'Icons.work',
            categoryGradient: args?['categoryGradient'] ?? [AppColors.primary, AppColors.secondary],
          );
        });
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text("No route defined for ${settings.name}")),
          ),
        );
    }
  }
}
