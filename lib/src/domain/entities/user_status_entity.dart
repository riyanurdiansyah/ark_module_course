import 'dart:convert';

String userStatusEntityToJson(UserStatusEntity data) =>
    json.encode(data.toJson());

class UserStatusEntity {
  UserStatusEntity({
    required this.userId,
    required this.userStatus,
    required this.userExpiry,
    required this.isExpired,
  });

  final int userId;
  final String userStatus;
  final String userExpiry;
  final bool isExpired;

  UserStatusEntity copyWith({
    int? userId,
    String? userStatus,
    String? userExpiry,
    bool? isExpired,
  }) =>
      UserStatusEntity(
        userId: userId ?? this.userId,
        userStatus: userStatus ?? this.userStatus,
        userExpiry: userExpiry ?? this.userExpiry,
        isExpired: isExpired ?? this.isExpired,
      );
  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_status": userStatus,
        "user_expiry": userExpiry,
      };
}
