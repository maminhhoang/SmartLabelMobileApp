class ImageEntity {
  final int imageId;
  final String originalName;
  final String cdnUrl;
  final int width;
  final int height;
  final String status; // Pending | In Progress | Completed | Reviewed

  const ImageEntity({
    required this.imageId,
    required this.originalName,
    required this.cdnUrl,
    required this.width,
    required this.height,
    required this.status,
  });
}


