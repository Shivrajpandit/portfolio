import 'package:flutter/material.dart';
// import 'package:flutter_web_plugins/flutter_web_plugins.dart'; // Optional for URL strategy
import 'core/router/app_router.dart';
import 'core/theme/theme.dart';

void main() {
  // setUrlStrategy(PathUrlStrategy()); // Optional: Remove # from URL
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerConfig: AppRouter.router,
    );
  }
}
