import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/di.dart';
import '../../domain/entities/class_label.dart';

final classesRepositoryProvider = Provider((ref) => DI.classesRepository);

final classListProvider = FutureProvider<List<ClassLabel>>((ref) async {
  final repo = ref.watch(classesRepositoryProvider);
  return repo.listClasses();
});


