import '../entities/review.dart';

abstract class ReviewsRepository {
  Future<List<ReviewEntity>> listReviews({String? status, int page = 1, int limit = 20});
  Future<ReviewEntity> createReview({required int objectId, required int labelId, required String reviewStatus, String? reviewNotes});
  Future<ReviewEntity> updateReview({required int reviewId, String? reviewStatus, String? reviewNotes});
}


