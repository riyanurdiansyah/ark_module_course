import 'dart:convert';

String ulasanEntityToJson(UlasanEntity data) => json.encode(data.toJson());

class UlasanEntity {
  UlasanEntity({
    required this.success,
    required this.data,
  });

  final bool success;
  final UlasanParseDataEntity data;

  UlasanEntity copyWith({
    bool? success,
    UlasanParseDataEntity? data,
  }) =>
      UlasanEntity(
        success: success ?? this.success,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class UlasanParseDataEntity {
  UlasanParseDataEntity({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  final int currentPage;
  final List<UlasanDataEntity> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final String links;
  final String nextPageUrl;
  final String path;
  final int perPage;
  final dynamic prevPageUrl;
  final int to;
  final int total;

  UlasanParseDataEntity copyWith({
    int? currentPage,
    List<UlasanDataEntity>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    String? links,
    String? nextPageUrl,
    String? path,
    int? perPage,
    dynamic prevPageUrl,
    int? to,
    int? total,
  }) =>
      UlasanParseDataEntity(
        currentPage: currentPage ?? this.currentPage,
        data: data ?? this.data,
        firstPageUrl: firstPageUrl ?? this.firstPageUrl,
        from: from ?? this.from,
        lastPage: lastPage ?? this.lastPage,
        lastPageUrl: lastPageUrl ?? this.lastPageUrl,
        links: links ?? this.links,
        nextPageUrl: nextPageUrl ?? this.nextPageUrl,
        path: path ?? this.path,
        perPage: perPage ?? this.perPage,
        prevPageUrl: prevPageUrl ?? this.prevPageUrl,
        to: to ?? this.to,
        total: total ?? this.total,
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class UlasanDataEntity {
  UlasanDataEntity({
    required this.commentId,
    required this.commentPostId,
    required this.commentAuthor,
    required this.commentDate,
    required this.commentContent,
    required this.userId,
    required this.nameAuthor,
    required this.avatarAuthor,
    required this.reviewTitle,
    required this.reviewRating,
  });

  final String commentId;
  final String commentPostId;
  final String commentAuthor;
  final DateTime commentDate;
  final String commentContent;
  final String userId;
  final String nameAuthor;
  final String avatarAuthor;
  final String reviewTitle;
  final String reviewRating;

  UlasanDataEntity copyWith({
    String? commentId,
    String? commentPostId,
    String? commentAuthor,
    DateTime? commentDate,
    String? commentContent,
    String? userId,
    String? nameAuthor,
    String? avatarAuthor,
    String? reviewTitle,
    String? reviewRating,
  }) =>
      UlasanDataEntity(
        commentId: commentId ?? this.commentId,
        commentPostId: commentPostId ?? this.commentPostId,
        commentAuthor: commentAuthor ?? this.commentAuthor,
        commentDate: commentDate ?? this.commentDate,
        commentContent: commentContent ?? this.commentContent,
        userId: userId ?? this.userId,
        nameAuthor: nameAuthor ?? this.nameAuthor,
        avatarAuthor: avatarAuthor == 'belum upload' ? '' : this.avatarAuthor,
        reviewTitle: reviewTitle ?? this.reviewTitle,
        reviewRating: reviewRating ?? this.reviewRating,
      );

  Map<String, dynamic> toJson() => {
        "comment_ID": commentId,
        "comment_post_ID": commentPostId,
        "comment_author": commentAuthor,
        "comment_date": commentDate.toIso8601String(),
        "comment_content": commentContent,
        "user_id": userId,
        "name_author": nameAuthor,
        "avatar_author": avatarAuthor,
        "review_title": reviewTitle,
        "review_rating": reviewRating,
      };
}
