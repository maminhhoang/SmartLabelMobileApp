import '../../domain/entities/task.dart';
import '../../domain/entities/image.dart';
import '../../domain/repositories/tasks_repository.dart';

class TasksRepositoryMock implements TasksRepository {
  final List<TaskEntity> _tasks = [
    const TaskEntity(taskId: 1, batchId: 1, name: 'Batch A', assignedTo: 1, taskType: 'Object Labeling', status: 'In Progress', priority: 'Medium', progress: 42),
  ];
  final Map<int, List<ImageEntity>> _taskImages = {
    1: [
      const ImageEntity(imageId: 100, originalName: 'street.jpg', cdnUrl: 'https://cdn/mock/street.jpg', width: 1920, height: 1080, status: 'Reviewed'),
      const ImageEntity(imageId: 101, originalName: 'park.jpg', cdnUrl: 'https://cdn/mock/park.jpg', width: 1280, height: 720, status: 'Pending'),
    ]
  };

  @override
  Future<List<TaskEntity>> listTasks({int? assignedTo, String? status, int page = 1, int limit = 20}) async {
    await Future.delayed(const Duration(milliseconds: 150));
    var list = _tasks;
    if (assignedTo != null) list = list.where((t) => t.assignedTo == assignedTo).toList();
    if (status != null) list = list.where((t) => t.status == status).toList();
    return list;
  }

  @override
  Future<TaskEntity> getTask(int taskId) async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _tasks.firstWhere((t) => t.taskId == taskId);
  }

  @override
  Future<List<ImageEntity>> listTaskImages(int taskId, {int page = 1, int limit = 20}) async {
    await Future.delayed(const Duration(milliseconds: 120));
    return _taskImages[taskId] ?? const [];
  }

  @override
  Future<void> updateTaskProgress(int taskId, {required int progress}) async {
    await Future.delayed(const Duration(milliseconds: 80));
    final idx = _tasks.indexWhere((t) => t.taskId == taskId);
    if (idx == -1) return;
    final t = _tasks[idx];
    _tasks[idx] = TaskEntity(
      taskId: t.taskId,
      batchId: t.batchId,
      name: t.name,
      assignedTo: t.assignedTo,
      taskType: t.taskType,
      status: t.status,
      priority: t.priority,
      progress: progress,
    );
  }

  @override
  Future<void> updateTaskImage(int taskId, int imageId, {bool? isCompleted, int? annotationCount}) async {
    await Future.delayed(const Duration(milliseconds: 80));
    // no-op in mock for now
  }
}


