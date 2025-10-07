import '../entities/class_label.dart';

abstract class ClassesRepository {
  Future<List<ClassLabel>> listClasses();
  Future<ClassLabel> createClass({required String className, String colorCode = '#000000', bool isActive = true});
  Future<ClassLabel> updateClass({required int classId, String? className, String? colorCode, bool? isActive});
}


