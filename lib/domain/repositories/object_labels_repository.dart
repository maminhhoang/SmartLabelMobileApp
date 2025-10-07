import '../entities/object_label.dart';

abstract class ObjectLabelsRepository {
  Future<ObjectLabelEntity?> getLabel(int objectId);
  Future<ObjectLabelEntity> putLabel({required int objectId, required int classId, double? confidenceScore, String? notes});
  Future<void> deleteLabel(int objectId);
}


