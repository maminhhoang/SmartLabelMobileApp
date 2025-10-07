import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/auth_providers.dart';
import '../dashboard/dashboard_screen.dart';
import 'login_screen.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authStateProvider);

    return auth.when(
      data: (user) => user == null ? const LoginScreen() : const DashboardScreen(),
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Auth error: $e'),
              const SizedBox(height: 12),
              ElevatedButton(onPressed: () => ref.refresh(authStateProvider), child: const Text('Retry')),
            ],
          ),
        ),
      ),
    );
  }
}


