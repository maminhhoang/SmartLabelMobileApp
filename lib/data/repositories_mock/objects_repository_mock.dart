import '../../domain/entities/object.dart';
import '../../domain/repositories/objects_repository.dart';

class ObjectsRepositoryMock implements ObjectsRepository {
  final Map<int, ObjectEntity> _store = {
    10: const ObjectEntity(objectId: 10, imageId: 100, x: 420, y: 300, width: 250, height: 160, status: 'Ready for Labeling'),
  };

  @override
  Future<ObjectEntity> createObject({required int imageId, required int x, required int y, required int width, required int height, String? detectionMethod}) async {
    await Future.delayed(const Duration(milliseconds: 120));
    final nextId = _store.isEmpty ? 1 : (_store.keys.reduce((a, b) => a > b ? a : b) + 1);
    final obj = ObjectEntity(objectId: nextId, imageId: imageId, x: x, y: y, width: width, height: height, status: 'Ready for Labeling');
    _store[nextId] = obj;
    return obj;
  }

  @override
  Future<ObjectEntity> updateObject({required int objectId, int? x, int? y, int? width, int? height, String? status}) async {
    await Future.delayed(const Duration(milliseconds: 100));
    final current = _store[objectId];
    if (current == null) throw Exception('Object not found');
    final updated = ObjectEntity(
      objectId: current.objectId,
      imageId: current.imageId,
      x: x ?? current.x,
      y: y ?? current.y,
      width: width ?? current.width,
      height: height ?? current.height,
      status: status ?? current.status,
    );
    _store[objectId] = updated;
    return updated;
  }
}


