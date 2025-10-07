import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/di.dart';
import '../../domain/entities/object_label.dart';

final objectLabelsRepositoryProvider = Provider((ref) => DI.objectLabelsRepository);

final objectLabelProvider = FutureProvider.family<ObjectLabelEntity?, int>((ref, objectId) async {
  final repo = ref.watch(objectLabelsRepositoryProvider);
  return repo.getLabel(objectId);
});

final putObjectLabelProvider = FutureProvider.family<ObjectLabelEntity, ({int objectId, int classId, double? confidenceScore, String? notes})>((ref, params) async {
  final repo = ref.watch(objectLabelsRepositoryProvider);
  return repo.putLabel(objectId: params.objectId, classId: params.classId, confidenceScore: params.confidenceScore, notes: params.notes);
});


