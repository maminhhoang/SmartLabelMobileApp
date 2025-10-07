import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/di.dart';
import '../../domain/entities/image.dart';
import '../../domain/entities/object.dart';

final imagesRepositoryProvider = Provider((ref) => DI.imagesRepository);

final imagesListProvider = FutureProvider<List<ImageEntity>>((ref) async {
  final repo = ref.watch(imagesRepositoryProvider);
  return repo.listImages();
});

final imageDetailProvider = FutureProvider.family<ImageEntity, int>((ref, id) async {
  final repo = ref.watch(imagesRepositoryProvider);
  return repo.getImage(id);
});

final imageObjectsProvider = FutureProvider.family<List<ObjectEntity>, int>((ref, imageId) async {
  final repo = ref.watch(imagesRepositoryProvider);
  return repo.listImageObjects(imageId);
});


