class ReviewEntity {
  final int reviewId;
  final int objectId;
  final int labelId;
  final String reviewStatus; // Approved | Rejected | Needs Revision
  final String? reviewNotes;
  final int reviewedBy;
  final DateTime reviewedAt;

  const ReviewEntity({
    required this.reviewId,
    required this.objectId,
    required this.labelId,
    required this.reviewStatus,
    this.reviewNotes,
    required this.reviewedBy,
    required this.reviewedAt,
  });
}


