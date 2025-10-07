import '../../domain/entities/object_label.dart';

class ObjectLabelDto {
  final int labelId;
  final int objectId;
  final int classId;
  final double? confidenceScore;
  final int? labeledBy;
  final String? labeledAt; // ISO8601
  final String? notes;

  const ObjectLabelDto({
    required this.labelId,
    required this.objectId,
    required this.classId,
    this.confidenceScore,
    this.labeledBy,
    this.labeledAt,
    this.notes,
  });

  factory ObjectLabelDto.fromJson(Map<String, dynamic> json) => ObjectLabelDto(
        labelId: json['labelId'] as int,
        objectId: json['objectId'] as int,
        classId: json['classId'] as int,
        confidenceScore: (json['confidenceScore'] as num?)?.toDouble(),
        labeledBy: json['labeledBy'] as int?,
        labeledAt: json['labeledAt'] as String?,
        notes: json['notes'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'labelId': labelId,
        'objectId': objectId,
        'classId': classId,
        'confidenceScore': confidenceScore,
        'labeledBy': labeledBy,
        'labeledAt': labeledAt,
        'notes': notes,
      };

  ObjectLabelEntity toEntity() => ObjectLabelEntity(
        labelId: labelId,
        objectId: objectId,
        classId: classId,
        confidenceScore: confidenceScore,
        labeledBy: labeledBy,
        labeledAt: labeledAt != null ? DateTime.parse(labeledAt!) : null,
        notes: notes,
      );
}


