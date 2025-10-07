import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/tasks_providers.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: tasks.when(
        data: (list) => ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, i) => ListTile(
            title: Text(list[i].name),
            subtitle: Text('Progress: ${list[i].progress}%'),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Failed to load tasks: $e')),
      ),
    );
  }
}


