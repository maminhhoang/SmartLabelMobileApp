class ObjectLabelEntity {
  final int labelId;
  final int objectId;
  final int classId;
  final double? confidenceScore;
  final int? labeledBy;
  final DateTime? labeledAt;
  final String? notes;

  const ObjectLabelEntity({
    required this.labelId,
    required this.objectId,
    required this.classId,
    this.confidenceScore,
    this.labeledBy,
    this.labeledAt,
    this.notes,
  });
}


