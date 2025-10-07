import '../../domain/entities/review.dart';
import '../../domain/repositories/reviews_repository.dart';

class ReviewsRepositoryMock implements ReviewsRepository {
  final List<ReviewEntity> _reviews = [];

  @override
  Future<List<ReviewEntity>> listReviews({String? status, int page = 1, int limit = 20}) async {
    await Future.delayed(const Duration(milliseconds: 100));
    var list = _reviews;
    if (status != null) list = list.where((r) => r.reviewStatus == status).toList();
    return list;
  }

  @override
  Future<ReviewEntity> createReview({required int objectId, required int labelId, required String reviewStatus, String? reviewNotes}) async {
    await Future.delayed(const Duration(milliseconds: 120));
    final nextId = _reviews.isEmpty ? 1 : (_reviews.map((e) => e.reviewId).reduce((a, b) => a > b ? a : b) + 1);
    final r = ReviewEntity(
      reviewId: nextId,
      objectId: objectId,
      labelId: labelId,
      reviewStatus: reviewStatus,
      reviewNotes: reviewNotes,
      reviewedBy: 1,
      reviewedAt: DateTime.now(),
    );
    _reviews.add(r);
    return r;
  }

  @override
  Future<ReviewEntity> updateReview({required int reviewId, String? reviewStatus, String? reviewNotes}) async {
    await Future.delayed(const Duration(milliseconds: 100));
    final idx = _reviews.indexWhere((e) => e.reviewId == reviewId);
    if (idx == -1) throw Exception('Review not found');
    final current = _reviews[idx];
    final updated = ReviewEntity(
      reviewId: current.reviewId,
      objectId: current.objectId,
      labelId: current.labelId,
      reviewStatus: reviewStatus ?? current.reviewStatus,
      reviewNotes: reviewNotes ?? current.reviewNotes,
      reviewedBy: current.reviewedBy,
      reviewedAt: current.reviewedAt,
    );
    _reviews[idx] = updated;
    return updated;
  }
}


