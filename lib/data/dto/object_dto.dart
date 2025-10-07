import '../../domain/entities/object.dart';

class ObjectDto {
  final int objectId;
  final int imageId;
  final int x;
  final int y;
  final int width;
  final int height;
  final String status;

  const ObjectDto({
    required this.objectId,
    required this.imageId,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.status,
  });

  factory ObjectDto.fromJson(Map<String, dynamic> json) => ObjectDto(
        objectId: json['objectId'] as int,
        imageId: json['imageId'] as int,
        x: json['x'] as int,
        y: json['y'] as int,
        width: json['width'] as int,
        height: json['height'] as int,
        status: json['status'] as String,
      );

  Map<String, dynamic> toJson() => {
        'objectId': objectId,
        'imageId': imageId,
        'x': x,
        'y': y,
        'width': width,
        'height': height,
        'status': status,
      };

  ObjectEntity toEntity() => ObjectEntity(
        objectId: objectId,
        imageId: imageId,
        x: x,
        y: y,
        width: width,
        height: height,
        status: status,
      );
}


