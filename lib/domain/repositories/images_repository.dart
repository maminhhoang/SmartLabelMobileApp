import '../entities/image.dart';
import '../entities/object.dart';

abstract class ImagesRepository {
  Future<List<ImageEntity>> listImages({String? status, int page = 1, int limit = 20});
  Future<(String uploadUrl, String fileId)> requestUploadUrl();
  Future<ImageEntity> completeUpload({required String fileId, required String originalName, required int width, required int height});
  Future<ImageEntity> getImage(int imageId);
  Future<List<ObjectEntity>> listImageObjects(int imageId);
}


