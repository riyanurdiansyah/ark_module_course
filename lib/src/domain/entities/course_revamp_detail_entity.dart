// To parse this JSON data, do
//
//     final courseRevampDetailEntity = courseRevampDetailEntityFromJson(jsonString);

import 'dart:convert';

CourseRevampDetailEntity courseRevampDetailEntityFromJson(String str) =>
    CourseRevampDetailEntity.fromJson(json.decode(str));

String courseRevampDetailEntityToJson(CourseRevampDetailEntity data) =>
    json.encode(data.toJson());

class CourseRevampDetailEntity {
  CourseRevampDetailEntity({
    required this.success,
    required this.data,
  });

  bool success;
  List<CourseRevampDataDetailEntity> data;

  factory CourseRevampDetailEntity.fromJson(Map<String, dynamic> json) =>
      CourseRevampDetailEntity(
        success: json["success"],
        data: List<CourseRevampDataDetailEntity>.from(
            json["data"].map((x) => CourseRevampDataDetailEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CourseRevampDataDetailEntity {
  CourseRevampDataDetailEntity({
    this.course,
  });

  Course? course;

  factory CourseRevampDataDetailEntity.fromJson(Map<String, dynamic> json) =>
      CourseRevampDataDetailEntity(
        course: Course.fromJson(json["course"]),
      );

  Map<String, dynamic> toJson() => {
        "course": course!.toJson(),
      };
}

class Course {
  Course({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.courseSlug,
    required this.dateCreated,
    required this.dateUpdated,
    required this.status,
    required this.price,
    required this.productId,
    required this.regularPrice,
    required this.iosPrice,
    required this.salePrice,
    required this.totalStudents,
    required this.seats,
    required this.startDate,
    required this.averageRating,
    required this.ratingCount,
    required this.courseDurationTime,
    required this.featuredImage,
    required this.categories,
    required this.description,
    required this.instructor,
    required this.tagKursus,
    required this.courseFlag,
    required this.courseDuration,
    required this.sertifikatFrameUrl,
    required this.peluangKarir,
    required this.tujuanUmum,
    required this.tujuanKhusus,
    required this.ygAkanDipelajariWeb,
    required this.skillYgAkanDiperolehWeb,
    required this.ygAkanDipelajari,
    required this.skillYgAkanDiperoleh,
    required this.sasaranKelompok,
    required this.sasaranKompetensi,
    required this.standarKompetensi,
    required this.lowongan,
    required this.coin,
    required this.od,
    required this.enableFaceRecog,
    required this.mpLinks,
    required this.instructors,
    required this.fasilitator,
    required this.ikhtisar,
    required this.descriptionInstruktur,
    required this.sertifikatKelulusanDesc,
    required this.pmoKategori,
    required this.sesiKonsultasi,
    required this.thumbnailSquare,
    required this.metaTitle,
    required this.metaDescription,
    required this.metaKeyword,
  });

  int? id;
  String? name;
  String? subtitle;
  String? courseSlug;
  int? dateCreated;
  int? dateUpdated;
  String? status;
  String? price;
  String? productId;
  String? regularPrice;
  String? iosPrice;
  String? salePrice;
  int? totalStudents;
  String? seats;
  bool? startDate;
  String? averageRating;
  String? ratingCount;
  String? courseDurationTime;
  String? featuredImage;
  List<Category> categories;
  String? description;
  PurpleInstructor? instructor;
  String? tagKursus;
  CourseFlag? courseFlag;
  dynamic courseDuration;
  String? sertifikatFrameUrl;
  List<String>? peluangKarir;
  String? tujuanUmum;
  String? tujuanKhusus;
  List<String>? ygAkanDipelajariWeb;
  List<String>? skillYgAkanDiperolehWeb;
  String? ygAkanDipelajari;
  String? skillYgAkanDiperoleh;
  String? sasaranKelompok;
  String? sasaranKompetensi;
  String? standarKompetensi;
  Lowongan? lowongan;
  Coin? coin;
  bool? od;
  int? enableFaceRecog;
  List<MpLink>? mpLinks;
  List<InstructorElement>? instructors;
  List<Fasilitator>? fasilitator;
  String? ikhtisar;
  String? descriptionInstruktur;
  String? sertifikatKelulusanDesc;
  String? pmoKategori;
  String? sesiKonsultasi;
  String? thumbnailSquare;
  dynamic metaTitle;
  dynamic metaDescription;
  dynamic metaKeyword;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        name: json["name"],
        subtitle: json["subtitle"],
        courseSlug: json["course_slug"],
        dateCreated: json["date_created"] ?? "",
        dateUpdated: json["date_updated"] ?? "",
        status: json["status"],
        price: json["price"],
        productId: json["product_id"],
        regularPrice: json["regular_price"],
        iosPrice: json["ios_price"],
        salePrice: json["sale_price"],
        totalStudents: json["total_students"],
        seats: json["seats"],
        startDate: json["start_date"],
        averageRating: json["average_rating"],
        ratingCount: json["rating_count"],
        courseDurationTime: json["course_duration_time"],
        featuredImage: json["featured_image"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        description: json["description"],
        instructor: PurpleInstructor.fromJson(json["instructor"]),
        tagKursus: json["tag_kursus"],
        courseFlag: CourseFlag.fromJson(json["course_flag"]),
        courseDuration: json["course_duration"],
        sertifikatFrameUrl: json["sertifikat_frame_url"],
        peluangKarir: List<String>.from(json["peluang_karir"].map((x) => x)),
        tujuanUmum: json["tujuan_umum"],
        tujuanKhusus: json["tujuan_khusus"],
        ygAkanDipelajariWeb:
            List<String>.from(json["yg_akan_dipelajari_web"].map((x) => x)),
        skillYgAkanDiperolehWeb: List<String>.from(
            json["skill_yg_akan_diperoleh_web"].map((x) => x)),
        ygAkanDipelajari: json["yg_akan_dipelajari"],
        skillYgAkanDiperoleh: json["skill_yg_akan_diperoleh"],
        sasaranKelompok: json["sasaran_kelompok"],
        sasaranKompetensi: json["sasaran_kompetensi"],
        standarKompetensi: json["standar_kompetensi"],
        lowongan: Lowongan.fromJson(json["lowongan"]),
        coin: Coin.fromJson(json["coin"]),
        od: json["od"],
        enableFaceRecog: json["enable_face_recog"],
        mpLinks: json["mp_links"] == null
            ? []
            : List<MpLink>.from(
                json["mp_links"].map((x) => MpLink.fromJson(x))),
        instructors: List<InstructorElement>.from(
            json["instructors"].map((x) => InstructorElement.fromJson(x))),
        fasilitator: List<Fasilitator>.from(
            json["fasilitator"].map((x) => Fasilitator.fromJson(x))),
        ikhtisar: json["ikhtisar"],
        descriptionInstruktur: json["description_instruktur"],
        sertifikatKelulusanDesc: json["sertifikat_kelulusan_desc"],
        pmoKategori: json["pmo_kategori"],
        sesiKonsultasi: json["sesi_konsultasi"],
        thumbnailSquare: json["thumbnail_square"],
        metaTitle: json["meta_title"] == null ? null : json['meta_title'],
        metaDescription: json["meta_description"],
        metaKeyword: json["meta_keyword"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "subtitle": subtitle,
        "course_slug": courseSlug,
        "date_created": dateCreated,
        "date_updated": dateUpdated,
        "status": status,
        "price": price,
        "product_id": productId,
        "regular_price": regularPrice,
        "ios_price": iosPrice,
        "sale_price": salePrice,
        "total_students": totalStudents,
        "seats": seats,
        "start_date": startDate,
        "average_rating": averageRating,
        "rating_count": ratingCount,
        "course_duration_time": courseDurationTime,
        "featured_image": featuredImage,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "description": description,
        "instructor": instructor!.toJson(),
        "tag_kursus": tagKursus,
        "course_flag": courseFlag!.toJson(),
        "course_duration": courseDuration,
        "sertifikat_frame_url": sertifikatFrameUrl,
        "peluang_karir": List<dynamic>.from(peluangKarir!.map((x) => x)),
        "tujuan_umum": tujuanUmum,
        "tujuan_khusus": tujuanKhusus,
        "yg_akan_dipelajari_web":
            List<dynamic>.from(ygAkanDipelajariWeb!.map((x) => x)),
        "skill_yg_akan_diperoleh_web":
            List<dynamic>.from(skillYgAkanDiperolehWeb!.map((x) => x)),
        "yg_akan_dipelajari": ygAkanDipelajari,
        "skill_yg_akan_diperoleh": skillYgAkanDiperoleh,
        "sasaran_kelompok": sasaranKelompok,
        "sasaran_kompetensi": sasaranKompetensi,
        "standar_kompetensi": standarKompetensi,
        "lowongan": lowongan!.toJson(),
        "coin": coin!.toJson(),
        "od": od,
        "enable_face_recog": enableFaceRecog,
        "mp_links": List<dynamic>.from(mpLinks!.map((x) => x.toJson())),
        "instructors": List<dynamic>.from(instructors!.map((x) => x.toJson())),
        "fasilitator": List<dynamic>.from(fasilitator!.map((x) => x.toJson())),
        "ikhtisar": ikhtisar,
        "description_instruktur": descriptionInstruktur,
        "sertifikat_kelulusan_desc": sertifikatKelulusanDesc,
        "pmo_kategori": pmoKategori,
        "sesi_konsultasi": sesiKonsultasi,
        "thumbnail_square": thumbnailSquare,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_keyword": metaKeyword,
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.slugs,
    required this.image,
  });

  int id;
  String name;
  String slugs;
  String image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slugs: json["slugs"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slugs": slugs,
        "image": image,
      };
}

class Coin {
  Coin({
    required this.coinFlag,
    required this.coinValue,
    required this.coinDescription,
  });

  String coinFlag;
  String coinValue;
  String coinDescription;

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        coinFlag: json["coin_flag"],
        coinValue: json["coin_value"],
        coinDescription: json["coin_description"],
      );

  Map<String, dynamic> toJson() => {
        "coin_flag": coinFlag,
        "coin_value": coinValue,
        "coin_description": coinDescription,
      };
}

class CourseFlag {
  CourseFlag({
    required this.whatsapp,
    required this.prakerja,
    required this.revamp,
    required this.jrc,
    required this.group,
  });

  String whatsapp;
  String prakerja;
  String revamp;
  String jrc;
  String group;

  factory CourseFlag.fromJson(Map<String, dynamic> json) => CourseFlag(
        whatsapp: json["whatsapp"],
        prakerja: json["prakerja"],
        revamp: json["revamp"],
        jrc: json["jrc"] ?? "",
        group: json["group"],
      );

  Map<String, dynamic> toJson() => {
        "whatsapp": whatsapp,
        "prakerja": prakerja,
        "revamp": revamp,
        "jrc": jrc,
        "group": group,
      };
}

class Fasilitator {
  Fasilitator({
    required this.userId,
    required this.name,
    required this.avatar,
    required this.namaPerusahaan,
    required this.deskripsi,
    required this.instagram,
    required this.linkedin,
  });

  String userId;
  String name;
  String avatar;
  String namaPerusahaan;
  String deskripsi;
  String instagram;
  String linkedin;

  factory Fasilitator.fromJson(Map<String, dynamic> json) => Fasilitator(
        userId: json["user_id"],
        name: json["name"],
        avatar: json["avatar"],
        namaPerusahaan: json["nama_perusahaan"],
        deskripsi: json["deskripsi"],
        instagram: json["instagram"],
        linkedin: json["linkedin"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "avatar": avatar,
        "nama_perusahaan": namaPerusahaan,
        "deskripsi": deskripsi,
        "instagram": instagram,
        "linkedin": linkedin,
      };
}

class PurpleInstructor {
  PurpleInstructor({
    required this.id,
    required this.name,
    required this.username,
    required this.avatar,
    required this.sub,
  });

  String id;
  String name;
  String username;
  Avatar avatar;
  String sub;

  factory PurpleInstructor.fromJson(Map<String, dynamic> json) =>
      PurpleInstructor(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        avatar: Avatar.fromJson(json["avatar"]),
        sub: json["sub"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "avatar": avatar.toJson(),
        "sub": sub,
      };
}

class Avatar {
  Avatar({
    required this.url,
  });

  String url;

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class InstructorElement {
  InstructorElement({
    required this.id,
    required this.name,
    required this.avatar,
    required this.sub,
    required this.averageRating,
    required this.studentCount,
    required this.courseCount,
    required this.bio,
  });

  String id;
  String name;
  bool avatar;
  String sub;
  String averageRating;
  String studentCount;
  String courseCount;
  String bio;

  factory InstructorElement.fromJson(Map<String, dynamic> json) =>
      InstructorElement(
        id: json["id"],
        name: json["name"],
        avatar: json["avatar"],
        sub: json["sub"],
        averageRating: json["average_rating"],
        studentCount: json["student_count"],
        courseCount: json["course_count"],
        bio: json["bio"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avatar": avatar,
        "sub": sub,
        "average_rating": averageRating,
        "student_count": studentCount,
        "course_count": courseCount,
        "bio": bio,
      };
}

class Lowongan {
  Lowongan({
    required this.id,
    required this.courseId,
    required this.jumlahLowongan,
    required this.startdateLowongan,
    required this.enddateLowongan,
    required this.categoryJob,
    required this.gajiMin,
    required this.gajiMax,
    required this.hari,
    required this.reference,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String courseId;
  String jumlahLowongan;
  DateTime startdateLowongan;
  DateTime enddateLowongan;
  String categoryJob;
  String gajiMin;
  String gajiMax;
  String hari;
  String reference;
  dynamic createdAt;
  dynamic updatedAt;

  factory Lowongan.fromJson(Map<String, dynamic> json) => Lowongan(
        id: json["id"],
        courseId: json["course_id"],
        jumlahLowongan: json["jumlah_lowongan"],
        startdateLowongan: DateTime.parse(json["startdate_lowongan"]),
        enddateLowongan: DateTime.parse(json["enddate_lowongan"]),
        categoryJob: json["category_job"],
        gajiMin: json["gaji_min"],
        gajiMax: json["gaji_max"],
        hari: json["hari"],
        reference: json["reference"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "course_id": courseId,
        "jumlah_lowongan": jumlahLowongan,
        "startdate_lowongan": startdateLowongan.toIso8601String(),
        "enddate_lowongan": enddateLowongan.toIso8601String(),
        "category_job": categoryJob,
        "gaji_min": gajiMin,
        "gaji_max": gajiMax,
        "hari": hari,
        "reference": reference,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class MpLink {
  MpLink({
    required this.mpName,
    required this.mpLogo,
    required this.mpProdukLink,
  });

  String mpName;
  String mpLogo;
  String mpProdukLink;

  factory MpLink.fromJson(Map<String, dynamic> json) => MpLink(
        mpName: json["mp_name"],
        mpLogo: json["mp_logo"],
        mpProdukLink: json["mp_produk_link"],
      );

  Map<String, dynamic> toJson() => {
        "mp_name": mpName,
        "mp_logo": mpLogo,
        "mp_produk_link": mpProdukLink,
      };
}
