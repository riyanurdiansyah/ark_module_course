import 'dart:convert';

import 'package:ark_module_course/src/domain/entities/ulasan_entity.dart';

UlasanDTO ulasanFromJson(String str) => UlasanDTO.fromJson(json.decode(str));

class UlasanDTO extends UlasanEntity {
  UlasanDTO({
    required super.success,
    required super.data,
  });
  factory UlasanDTO.fromJson(Map<String, dynamic> json) => UlasanDTO(
        success: json["success"],
        data: UlasanParseDataDTO.fromJson(json["data"]),
      );
}

class UlasanParseDataDTO extends UlasanParseDataEntity {
  UlasanParseDataDTO({
    required super.currentPage,
    required super.data,
    required super.firstPageUrl,
    required super.from,
    required super.lastPage,
    required super.lastPageUrl,
    required super.links,
    required super.nextPageUrl,
    required super.path,
    required super.perPage,
    required super.prevPageUrl,
    required super.to,
    required super.total,
  });
  factory UlasanParseDataDTO.fromJson(Map<String, dynamic> json) =>
      UlasanParseDataDTO(
        currentPage: json["current_page"] ?? 0,
        data: json["data"] == null
            ? []
            : List<UlasanDataEntity>.from(
                json["data"].map((x) => UlasanDataDTO.fromJson(x))),
        firstPageUrl: json["first_page_url"] ?? "",
        from: json["from"] ?? 0,
        lastPage: json["last_page"] ?? 0,
        lastPageUrl: json["last_page_url"] ?? "",
        links: json["links"] ?? "",
        nextPageUrl: json["next_page_url"] ?? "",
        path: json["path"] ?? "",
        perPage: json["per_page"] ?? 0,
        prevPageUrl: json["prev_page_url"] ?? "",
        to: json["to"] ?? 0,
        total: json["total"] ?? 0,
      );
}

class UlasanDataDTO extends UlasanDataEntity {
  UlasanDataDTO({
    required super.commentId,
    required super.commentPostId,
    required super.commentAuthor,
    required super.commentDate,
    required super.commentContent,
    required super.userId,
    required super.nameAuthor,
    required super.avatarAuthor,
    required super.reviewTitle,
    required super.reviewRating,
  });

  factory UlasanDataDTO.fromJson(Map<String, dynamic> json) => UlasanDataDTO(
        commentId: json["comment_ID"] ?? "",
        commentPostId: json["comment_post_ID"] ?? "",
        commentAuthor: json["comment_author"] ?? "",
        commentDate: json["comment_date"] == null
            ? DateTime.now()
            : DateTime.parse(json["comment_date"]),
        commentContent: json["comment_content"] ?? "",
        userId: json["user_id"] ?? "",
        nameAuthor: json["name_author"] ?? "",
        avatarAuthor: json["avatar_author"] ?? "",
        reviewTitle: json["review_title"] ?? "",
        reviewRating:
            json["review_rating"] == "" || json["review_rating"] == null
                ? "5"
                : json["review_rating"] ?? "0",
      );
}
