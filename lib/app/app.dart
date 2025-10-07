import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../app/di.dart';
import '../core/theme.dart';
import 'routes.dart' as r;
import '../presentation/features/auth/auth_gate.dart';

class SmartLabelingApp extends StatelessWidget {
  const SmartLabelingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Smart Labeling',
        theme: AppTheme.light(),
        onGenerateRoute: r.onGenerateRoute,
        home: const AuthGate(),
      ),
    );
  }
}

void bootstrap() {
  DI.init();
}


