import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/di.dart';
import '../../domain/entities/task.dart';
import '../../domain/entities/image.dart';

final tasksRepositoryProvider = Provider((ref) => DI.tasksRepository);

final taskListProvider = FutureProvider.autoDispose<List<TaskEntity>>((ref) async {
  final repo = ref.watch(tasksRepositoryProvider);
  return repo.listTasks();
});

final taskDetailProvider = FutureProvider.family<TaskEntity, int>((ref, id) async {
  final repo = ref.watch(tasksRepositoryProvider);
  return repo.getTask(id);
});

final taskImagesProvider = FutureProvider.family<List<ImageEntity>, int>((ref, taskId) async {
  final repo = ref.watch(tasksRepositoryProvider);
  return repo.listTaskImages(taskId);
});


