import 'package:flutter/material.dart';
import '../presentation/features/auth/login_screen.dart';
import '../presentation/features/dashboard/dashboard_screen.dart';

class Routes {
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const tasks = '/tasks';
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.login:
      return MaterialPageRoute(builder: (_) => const LoginScreen(), settings: settings);
    case Routes.dashboard:
      return MaterialPageRoute(builder: (_) => const DashboardScreen(), settings: settings);
    default:
      return MaterialPageRoute(builder: (_) => const _PlaceholderScreen(), settings: settings);
  }
}

class _PlaceholderScreen extends StatelessWidget {
  const _PlaceholderScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Smart Labeling')),
      body: const Center(child: Text('App shell ready. Screens coming soon.')),
    );
  }
}


