import 'package:flutter/material.dart';
import 'package:one_day_worker/core/routes/app_routes.dart';
import 'package:one_day_worker/core/routes/route_names.dart';
import 'package:one_day_worker/core/theme/app_theme.dart';

import 'features/signUp/presentation/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'One Day Worker',
      theme: AppTheme.lightTheme,
      initialRoute: RouteNames.splash,
      onGenerateRoute: AppRoutes.routes,
    );
  }
}
