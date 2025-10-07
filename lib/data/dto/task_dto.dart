import '../../domain/entities/task.dart';

class TaskDto {
  final int taskId;
  final int batchId;
  final String name;
  final int? assignedTo;
  final String taskType;
  final String status;
  final String priority;
  final int progress;

  const TaskDto({
    required this.taskId,
    required this.batchId,
    required this.name,
    this.assignedTo,
    required this.taskType,
    required this.status,
    required this.priority,
    required this.progress,
  });

  factory TaskDto.fromJson(Map<String, dynamic> json) => TaskDto(
        taskId: json['taskId'] as int,
        batchId: json['batchId'] as int,
        name: json['name'] as String? ?? '',
        assignedTo: json['assignedTo'] as int?,
        taskType: json['taskType'] as String,
        status: json['status'] as String,
        priority: json['priority'] as String,
        progress: json['progress'] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'taskId': taskId,
        'batchId': batchId,
        'name': name,
        'assignedTo': assignedTo,
        'taskType': taskType,
        'status': status,
        'priority': priority,
        'progress': progress,
      };

  TaskEntity toEntity() => TaskEntity(
        taskId: taskId,
        batchId: batchId,
        name: name,
        assignedTo: assignedTo,
        taskType: taskType,
        status: status,
        priority: priority,
        progress: progress,
      );
}


