import '../../domain/entities/object_label.dart';
import '../../domain/repositories/object_labels_repository.dart';

class ObjectLabelsRepositoryMock implements ObjectLabelsRepository {
  final Map<int, ObjectLabelEntity> _labels = {};

  @override
  Future<ObjectLabelEntity?> getLabel(int objectId) async {
    await Future.delayed(const Duration(milliseconds: 80));
    return _labels[objectId];
  }

  @override
  Future<ObjectLabelEntity> putLabel({required int objectId, required int classId, double? confidenceScore, String? notes}) async {
    await Future.delayed(const Duration(milliseconds: 120));
    final label = ObjectLabelEntity(
      labelId: _labels.length + 1,
      objectId: objectId,
      classId: classId,
      confidenceScore: confidenceScore,
      labeledBy: 1,
      labeledAt: DateTime.now(),
      notes: notes,
    );
    _labels[objectId] = label;
    return label;
  }

  @override
  Future<void> deleteLabel(int objectId) async {
    await Future.delayed(const Duration(milliseconds: 80));
    _labels.remove(objectId);
  }
}


