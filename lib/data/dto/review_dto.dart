import '../../domain/entities/review.dart';

class ReviewDto {
  final int reviewId;
  final int objectId;
  final int labelId;
  final String reviewStatus;
  final String? reviewNotes;
  final int reviewedBy;
  final String reviewedAt; // ISO8601

  const ReviewDto({
    required this.reviewId,
    required this.objectId,
    required this.labelId,
    required this.reviewStatus,
    this.reviewNotes,
    required this.reviewedBy,
    required this.reviewedAt,
  });

  factory ReviewDto.fromJson(Map<String, dynamic> json) => ReviewDto(
        reviewId: json['reviewId'] as int,
        objectId: json['objectId'] as int,
        labelId: json['labelId'] as int,
        reviewStatus: json['reviewStatus'] as String,
        reviewNotes: json['reviewNotes'] as String?,
        reviewedBy: json['reviewedBy'] as int,
        reviewedAt: json['reviewedAt'] as String,
      );

  Map<String, dynamic> toJson() => {
        'reviewId': reviewId,
        'objectId': objectId,
        'labelId': labelId,
        'reviewStatus': reviewStatus,
        'reviewNotes': reviewNotes,
        'reviewedBy': reviewedBy,
        'reviewedAt': reviewedAt,
      };

  ReviewEntity toEntity() => ReviewEntity(
        reviewId: reviewId,
        objectId: objectId,
        labelId: labelId,
        reviewStatus: reviewStatus,
        reviewNotes: reviewNotes,
        reviewedBy: reviewedBy,
        reviewedAt: DateTime.parse(reviewedAt),
      );
}


