import '../entities/task.dart';
import '../entities/image.dart';

abstract class TasksRepository {
  Future<List<TaskEntity>> listTasks({int? assignedTo, String? status, int page = 1, int limit = 20});
  Future<TaskEntity> getTask(int taskId);
  Future<List<ImageEntity>> listTaskImages(int taskId, {int page = 1, int limit = 20});
  Future<void> updateTaskProgress(int taskId, {required int progress});
  Future<void> updateTaskImage(int taskId, int imageId, {bool? isCompleted, int? annotationCount});
}


