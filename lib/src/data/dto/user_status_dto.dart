import 'dart:convert';
import 'package:ark_module_course/src/domain/entities/user_status_entity.dart';

UserStatusDTO userStatusFromJson(String str) =>
    UserStatusDTO.fromJson(json.decode(str));

class UserStatusDTO extends UserStatusEntity {
  UserStatusDTO({
    required super.userId,
    required super.userStatus,
    required super.userExpiry,
    required super.isExpired,
  });

  factory UserStatusDTO.fromJson(Map<String, dynamic> json) {
    int expiryTotal = 0;
    bool expired = false;
    if (json["user_expiry"] != null && json["user_expiry"] != "") {
      expiryTotal = int.parse(json["user_expiry"]);
      if (DateTime.now().millisecondsSinceEpoch / 1000 < expiryTotal) {
        expired = false;
      } else {
        expired = true;
      }
    }
    return UserStatusDTO(
      userId: json["user_id"],
      userStatus: json["user_status"] ?? "",
      userExpiry: json["user_expiry"] ?? "",
      isExpired: expired,
    );
  }
}
