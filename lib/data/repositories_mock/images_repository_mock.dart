import '../../domain/entities/image.dart';
import '../../domain/entities/object.dart';
import '../../domain/repositories/images_repository.dart';

class ImagesRepositoryMock implements ImagesRepository {
  final List<ImageEntity> _images = [
    const ImageEntity(imageId: 100, originalName: 'street.jpg', cdnUrl: 'https://cdn/mock/street.jpg', width: 1920, height: 1080, status: 'Reviewed'),
    const ImageEntity(imageId: 101, originalName: 'park.jpg', cdnUrl: 'https://cdn/mock/park.jpg', width: 1280, height: 720, status: 'Pending'),
  ];

  final Map<int, List<ObjectEntity>> _objects = {
    100: [
      const ObjectEntity(objectId: 10, imageId: 100, x: 420, y: 300, width: 250, height: 160, status: 'Ready for Labeling'),
      const ObjectEntity(objectId: 11, imageId: 100, x: 900, y: 400, width: 140, height: 120, status: 'Ready for Labeling'),
    ]
  };

  @override
  Future<List<ImageEntity>> listImages({String? status, int page = 1, int limit = 20}) async {
    await Future.delayed(const Duration(milliseconds: 150));
    var list = _images;
    if (status != null) {
      list = list.where((e) => e.status == status).toList();
    }
    return list;
  }

  @override
  Future<(String uploadUrl, String fileId)> requestUploadUrl() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return ('https://upload.mock/url', 'file-mock-id');
  }

  @override
  Future<ImageEntity> completeUpload({required String fileId, required String originalName, required int width, required int height}) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final newId = _images.isEmpty ? 1 : (_images.map((e) => e.imageId).reduce((a, b) => a > b ? a : b) + 1);
    final img = ImageEntity(imageId: newId, originalName: originalName, cdnUrl: 'https://cdn/mock/$originalName', width: width, height: height, status: 'Pending');
    _images.add(img);
    return img;
  }

  @override
  Future<ImageEntity> getImage(int imageId) async {
    await Future.delayed(const Duration(milliseconds: 80));
    return _images.firstWhere((e) => e.imageId == imageId);
  }

  @override
  Future<List<ObjectEntity>> listImageObjects(int imageId) async {
    await Future.delayed(const Duration(milliseconds: 120));
    return _objects[imageId] ?? const [];
  }
}


