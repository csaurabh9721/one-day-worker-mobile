import 'package:flutter/material.dart';
import 'package:one_day_worker/core/routes/route_names.dart';
import 'package:one_day_worker/features/splash/presentation/splash_page.dart';

import '../../features/initial/presentation/initial_page.dart';
import '../../features/signIn/presentation/sign_in_page.dart';
import '../../features/signUp/presentation/sign_up_page.dart';

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
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text("No route defined for ${settings.name}")),
          ),
        );
    }
  }
}
