import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/di.dart';
import '../../domain/entities/review.dart';

final reviewsRepositoryProvider = Provider((ref) => DI.reviewsRepository);

final reviewsListProvider = FutureProvider<List<ReviewEntity>>((ref) async {
  final repo = ref.watch(reviewsRepositoryProvider);
  return repo.listReviews();
});


