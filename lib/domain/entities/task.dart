class TaskEntity {
  final int taskId;
  final int batchId;
  final int? assignedTo;
  final String taskType; // Object Detection | Object Labeling | Review
  final String status; // Pending | In Progress | Completed
  final String priority; // Low | Medium | High
  final int progress; // 0-100
  final String name;

  const TaskEntity({
    required this.taskId,
    required this.batchId,
    required this.name,
    this.assignedTo,
    required this.taskType,
    required this.status,
    required this.priority,
    required this.progress,
  });
}


