import '../entities/object.dart';

abstract class ObjectsRepository {
  Future<ObjectEntity> createObject({required int imageId, required int x, required int y, required int width, required int height, String? detectionMethod});
  Future<ObjectEntity> updateObject({required int objectId, int? x, int? y, int? width, int? height, String? status});
}


