class ObjectEntity {
  final int objectId;
  final int imageId;
  final int x;
  final int y;
  final int width;
  final int height;
  final String status; // Pending | Ready for Labeling | Labeled | Reviewed

  const ObjectEntity({
    required this.objectId,
    required this.imageId,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.status,
  });
}


