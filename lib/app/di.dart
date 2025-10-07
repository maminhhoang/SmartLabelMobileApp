import '../app/env.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/repositories/classes_repository.dart';
import '../domain/repositories/images_repository.dart';
import '../domain/repositories/objects_repository.dart';
import '../domain/repositories/object_labels_repository.dart';
import '../domain/repositories/tasks_repository.dart';
import '../domain/repositories/reviews_repository.dart';
import '../data/repositories_mock/auth_repository_mock.dart';
import '../data/repositories_mock/classes_repository_mock.dart';
import '../data/repositories_mock/images_repository_mock.dart';
import '../data/repositories_mock/objects_repository_mock.dart';
import '../data/repositories_mock/object_labels_repository_mock.dart';
import '../data/repositories_mock/tasks_repository_mock.dart';
import '../data/repositories_mock/reviews_repository_mock.dart';

class DI {
  static late final AuthRepository authRepository;
  static late final ClassesRepository classesRepository;
  static late final ImagesRepository imagesRepository;
  static late final ObjectsRepository objectsRepository;
  static late final ObjectLabelsRepository objectLabelsRepository;
  static late final TasksRepository tasksRepository;
  static late final ReviewsRepository reviewsRepository;

  static void init() {
    if (AppEnv.useMocks) {
      authRepository = AuthRepositoryMock();
      classesRepository = ClassesRepositoryMock();
      imagesRepository = ImagesRepositoryMock();
      objectsRepository = ObjectsRepositoryMock();
      objectLabelsRepository = ObjectLabelsRepositoryMock();
      tasksRepository = TasksRepositoryMock();
      reviewsRepository = ReviewsRepositoryMock();
    } else {
      // TODO: wire HTTP repositories later
      authRepository = AuthRepositoryMock();
      classesRepository = ClassesRepositoryMock();
      imagesRepository = ImagesRepositoryMock();
      objectsRepository = ObjectsRepositoryMock();
      objectLabelsRepository = ObjectLabelsRepositoryMock();
      tasksRepository = TasksRepositoryMock();
      reviewsRepository = ReviewsRepositoryMock();
    }
  }
}


