import '../../domain/entities/class_label.dart';
import '../../domain/repositories/classes_repository.dart';

class ClassesRepositoryMock implements ClassesRepository {
  final List<ClassLabel> _classes = [
    const ClassLabel(classId: 1, className: 'Car', colorCode: '#00FF00', isActive: true),
    const ClassLabel(classId: 2, className: 'Person', colorCode: '#FF0000', isActive: true),
  ];

  @override
  Future<List<ClassLabel>> listClasses() async {
    await Future.delayed(const Duration(milliseconds: 150));
    return List<ClassLabel>.unmodifiable(_classes);
  }

  @override
  Future<ClassLabel> createClass({required String className, String colorCode = '#000000', bool isActive = true}) async {
    final nextId = _classes.isEmpty ? 1 : (_classes.map((e) => e.classId).reduce((a, b) => a > b ? a : b) + 1);
    final created = ClassLabel(classId: nextId, className: className, colorCode: colorCode, isActive: isActive);
    _classes.add(created);
    return created;
  }

  @override
  Future<ClassLabel> updateClass({required int classId, String? className, String? colorCode, bool? isActive}) async {
    final idx = _classes.indexWhere((e) => e.classId == classId);
    if (idx == -1) throw Exception('Class not found');
    final current = _classes[idx];
    final updated = ClassLabel(
      classId: classId,
      className: className ?? current.className,
      colorCode: colorCode ?? current.colorCode,
      isActive: isActive ?? current.isActive,
    );
    _classes[idx] = updated;
    return updated;
  }
}


