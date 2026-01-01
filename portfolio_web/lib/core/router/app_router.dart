import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/portfolio_main_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const PortfolioMainScreen();
        },
      ),
      // Redirects for old routes if necessary
      GoRoute(path: '/about', redirect: (_, __) => '/'),
      GoRoute(path: '/skills', redirect: (_, __) => '/'),
      GoRoute(path: '/projects', redirect: (_, __) => '/'),
      GoRoute(path: '/experience', redirect: (_, __) => '/'),
      GoRoute(path: '/contact', redirect: (_, __) => '/'),
    ],
  );
}
