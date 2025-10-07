import '../../domain/entities/image.dart';

class ImageDto {
  final int imageId;
  final String originalName;
  final String cdnUrl;
  final int width;
  final int height;
  final String status;

  const ImageDto({
    required this.imageId,
    required this.originalName,
    required this.cdnUrl,
    required this.width,
    required this.height,
    required this.status,
  });

  factory ImageDto.fromJson(Map<String, dynamic> json) => ImageDto(
        imageId: json['imageId'] as int,
        originalName: json['originalName'] as String,
        cdnUrl: json['cdnUrl'] as String? ?? '',
        width: json['width'] as int,
        height: json['height'] as int,
        status: json['status'] as String,
      );

  Map<String, dynamic> toJson() => {
        'imageId': imageId,
        'originalName': originalName,
        'cdnUrl': cdnUrl,
        'width': width,
        'height': height,
        'status': status,
      };

  ImageEntity toEntity() => ImageEntity(
        imageId: imageId,
        originalName: originalName,
        cdnUrl: cdnUrl,
        width: width,
        height: height,
        status: status,
      );
}


