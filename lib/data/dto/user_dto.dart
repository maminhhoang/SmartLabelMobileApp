import '../../domain/entities/user.dart';

class UserDto {
  final int userId;
  final String username;
  final String email;
  final String role;
  final bool isActive;

  const UserDto({
    required this.userId,
    required this.username,
    required this.email,
    required this.role,
    required this.isActive,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        userId: json['userId'] as int,
        username: json['username'] as String,
        email: json['email'] as String,
        role: json['role'] as String,
        isActive: json['isActive'] as bool? ?? true,
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'username': username,
        'email': email,
        'role': role,
        'isActive': isActive,
      };

  User toEntity() => User(
        userId: userId,
        username: username,
        email: email,
        role: role,
        isActive: isActive,
      );
}


