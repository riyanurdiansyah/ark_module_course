// To parse this JSON data, do
//
//     final courseRevamp = courseRevampFromJson(jsonString);

import 'dart:convert';

CourseRevampEntity courseRevampEntityFromJson(String str) =>
    CourseRevampEntity.fromJson(json.decode(str));

String courseRevampEntityToJson(CourseRevampEntity data) =>
    json.encode(data.toJson());

class CourseRevampEntity {
  CourseRevampEntity({
    required this.success,
    required this.data,
  });

  bool success;
  CourseRevampDataEntity data;

  factory CourseRevampEntity.fromJson(Map<String, dynamic> json) =>
      CourseRevampEntity(
        success: json["success"],
        data: CourseRevampDataEntity.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class CourseRevampDataEntity {
  CourseRevampDataEntity({
    required this.slug,
    required this.slugLama,
    required this.idKomentar,
    required this.stringSertifikat,
    required this.kategoriUtama,
    required this.pekerjaan,
    required this.rating,
    required this.judul,
    required this.subJudul,
    required this.fasilitatorAtas,
    required this.peluangKarir,
    required this.testimoni,
    required this.instruktur,
    required this.sertifikasi,
    required this.video,
    required this.intro,
    required this.isiFaq,
  });

  String slug;
  String slugLama;
  String idKomentar;
  String stringSertifikat;
  String kategoriUtama;
  Pekerjaan pekerjaan;
  Rating rating;
  String judul;
  String subJudul;
  String fasilitatorAtas;
  List<String> peluangKarir;
  List<Testimoni> testimoni;
  List<Instruktur> instruktur;
  String sertifikasi;
  List<Video> video;
  String intro;
  List<IsiFaq> isiFaq;

  factory CourseRevampDataEntity.fromJson(Map<String, dynamic> json) =>
      CourseRevampDataEntity(
        slug: json["slug"],
        slugLama: json["slugLama"],
        idKomentar: json["idKomentar"],
        stringSertifikat: json["stringSertifikat"],
        kategoriUtama: json["kategoriUtama"],
        pekerjaan: Pekerjaan.fromJson(json["pekerjaan"]),
        rating: Rating.fromJson(json["rating"]),
        judul: json["judul"],
        subJudul: json["subJudul"] ?? "",
        fasilitatorAtas: json["fasilitatorAtas"] ?? "",
        peluangKarir:
            json["peluangKarir"] == null || json['peluangKarir'] == false
                ? []
                : List<String>.from(json["peluangKarir"].map((x) => x)),
        testimoni: List<Testimoni>.from(
            json["testimoni"].map((x) => Testimoni.fromJson(x))),
        instruktur: List<Instruktur>.from(
            json["instruktur"].map((x) => Instruktur.fromJson(x))),
        sertifikasi: json["sertifikasi"],
        video: List<Video>.from(json["video"].map((x) => Video.fromJson(x))),
        intro: json["intro"],
        isiFaq:
            List<IsiFaq>.from(json["isiFaq"].map((x) => IsiFaq.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "slugLama": slugLama,
        "idKomentar": idKomentar,
        "stringSertifikat": stringSertifikat,
        "kategoriUtama": kategoriUtama,
        "pekerjaan": pekerjaan.toJson(),
        "rating": rating.toJson(),
        "judul": judul,
        "subJudul": subJudul,
        "fasilitatorAtas": fasilitatorAtas,
        "peluangKarir": List<dynamic>.from(peluangKarir.map((x) => x)),
        "testimoni": List<dynamic>.from(testimoni.map((x) => x.toJson())),
        "instruktur": List<dynamic>.from(instruktur.map((x) => x.toJson())),
        "sertifikasi": sertifikasi,
        "video": List<dynamic>.from(video.map((x) => x.toJson())),
        "intro": intro,
        "isiFaq": List<dynamic>.from(isiFaq.map((x) => x.toJson())),
      };
}

class Instruktur {
  Instruktur({
    required this.image,
    required this.nama,
    required this.deskripsi,
  });

  String image;
  String nama;
  String deskripsi;

  factory Instruktur.fromJson(Map<String, dynamic> json) => Instruktur(
        image: json["image"],
        nama: json["nama"],
        deskripsi: json["deskripsi"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "nama": nama,
        "deskripsi": deskripsi,
      };
}

class IsiFaq {
  IsiFaq({
    this.q,
    this.a,
  });

  String? q;
  String? a;

  factory IsiFaq.fromJson(Map<String, dynamic> json) => IsiFaq(
        q: json["Q"],
        a: json["A"],
      );

  Map<String, dynamic> toJson() => {
        "Q": q,
        "A": a,
      };
}

class Pekerjaan {
  Pekerjaan({
    required this.lowongan,
    required this.gajiRendah,
    required this.gajiTinggi,
    required this.hari,
  });

  String lowongan;
  String gajiRendah;
  String gajiTinggi;
  String hari;

  factory Pekerjaan.fromJson(Map<String, dynamic> json) => Pekerjaan(
        lowongan: json["lowongan"],
        gajiRendah: json["gajiRendah"],
        gajiTinggi: json["gajiTinggi"],
        hari: json["hari"],
      );

  Map<String, dynamic> toJson() => {
        "lowongan": lowongan,
        "gajiRendah": gajiRendah,
        "gajiTinggi": gajiTinggi,
        "hari": hari,
      };
}

class Rating {
  Rating({
    required this.rating,
    required this.jmlMurid,
  });

  String rating;
  String jmlMurid;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rating: json["rating"],
        jmlMurid: json["jmlMurid"],
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "jmlMurid": jmlMurid,
      };
}

class Testimoni {
  Testimoni({
    this.nama,
    this.image,
    this.rating,
    this.ulasan,
  });

  String? nama;
  String? image;
  String? rating;
  String? ulasan;

  factory Testimoni.fromJson(Map<String, dynamic> json) => Testimoni(
        nama: json["nama"],
        image: json["image"],
        rating: json["rating"],
        ulasan: json["ulasan"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "image": image,
        "rating": rating,
        "ulasan": ulasan,
      };
}

class Video {
  Video({
    this.id,
    this.content,
    this.title,
    this.curriculumTitle,
  });

  int? id;
  String? content;
  String? title;
  String? curriculumTitle;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        content: json["content"],
        title: json["title"],
        curriculumTitle: json["curriculum_title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "title": title,
        "curriculum_title": curriculumTitle,
      };
}
