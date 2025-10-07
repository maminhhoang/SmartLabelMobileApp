import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/di.dart';
import '../../domain/entities/object.dart';

final objectsRepositoryProvider = Provider((ref) => DI.objectsRepository);

class ObjectUpdateParams {
  final int objectId;
  final int? x;
  final int? y;
  final int? width;
  final int? height;
  final String? status;
  const ObjectUpdateParams({required this.objectId, this.x, this.y, this.width, this.height, this.status});
}

final objectCreateProvider = FutureProvider.family<ObjectEntity, ({int imageId, int x, int y, int width, int height})>((ref, params) async {
  final repo = ref.watch(objectsRepositoryProvider);
  return repo.createObject(imageId: params.imageId, x: params.x, y: params.y, width: params.width, height: params.height);
});

final objectUpdateProvider = FutureProvider.family<ObjectEntity, ObjectUpdateParams>((ref, params) async {
  final repo = ref.watch(objectsRepositoryProvider);
  return repo.updateObject(objectId: params.objectId, x: params.x, y: params.y, width: params.width, height: params.height, status: params.status);
});


