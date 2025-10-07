class User {
  final int userId;
  final String username;
  final String email;
  final String role; // Admin | Labeler | Reviewer
  final bool isActive;

  const User({
    required this.userId,
    required this.username,
    required this.email,
    required this.role,
    required this.isActive,
  });
}


