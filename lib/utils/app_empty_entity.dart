import 'package:ark_module_course/src/domain/entities/course_coin_entity.dart';
import 'package:ark_module_course/src/domain/entities/course_entity.dart';
import 'package:ark_module_course/src/domain/entities/course_flag_entity.dart';
import 'package:ark_module_course/src/domain/entities/course_jrc_entity.dart';
import 'package:ark_module_course/src/domain/entities/course_revamp_detail_entity.dart';
import 'package:ark_module_course/src/domain/entities/course_revamp_entity.dart';
import 'package:ark_module_course/src/domain/entities/fasilitator_jrc_entity.dart';
import 'package:ark_module_course/src/domain/entities/instructor_entity.dart';
import 'package:ark_module_course/src/domain/entities/lowongan_entity.dart';

final CourseDataEntity courseEmpty = CourseDataEntity(
  categories: const [],
  status: "",
  averageRating: "",
  courseSlug: "",
  description: "",
  descriptionInstruktur: "",
  enableFaceRecog: 0,
  featuredImage: "",
  id: 0,
  iosPrice: "0",
  name: "",
  price: "0",
  regularPrice: "0",
  salePrice: "0",
  totalStudents: 0,
  instructor: const InstructorEntity(
      id: "", name: "", avatar: AvatarEntity(url: ""), sub: ""),
  coinCashback: "0",
  discount: 0.0,
  courseFlag: CourseFlagEntity(
      whatsapp: "", prakerja: "", revamp: "", jrc: "", group: ""),
  mpLinks: const [],
  peluangKarir: const [],
  ratingCount: "",
  lowongan: LowonganEntity(
    id: 0,
    courseId: "",
    categoryJob: "",
    endDateLowongan: DateTime.now(),
    startDateLowongan: DateTime.now(),
    gajiMax: "",
    gajiMin: "",
    jumlahLowongan: "0",
    reference: "",
  ),
  ygAkanDipelajariWeb: const [],
  coin: CourseCoinEntity(
    coinFlag: "1",
    coinDescription: "",
    coinValue: "",
  ),
  productId: "",
);

final CourseRevampDetailEntity courseRevampDetailEntity =
    CourseRevampDetailEntity(
  success: false,
  data: <CourseRevampDataDetailEntity>[],
);

final CourseRevampEntity courseRevampEmpty = CourseRevampEntity(
  success: false,
  data: CourseRevampDataEntity(
      slug: '',
      slugLama: '',
      idKomentar: '0',
      stringSertifikat: '',
      kategoriUtama: '',
      pekerjaan:
          Pekerjaan(lowongan: '', gajiRendah: '', gajiTinggi: '', hari: ''),
      rating: Rating(rating: '', jmlMurid: ''),
      judul: '',
      subJudul: '',
      fasilitatorAtas: '',
      peluangKarir: <String>[],
      testimoni: <Testimoni>[],
      instruktur: <Instruktur>[],
      sertifikasi: '',
      video: <Video>[],
      intro: '',
      isiFaq: <IsiFaq>[]),
);

final CourseJrcEntity courseJrcEmpty = CourseJrcEntity(
  success: false,
  data: CourseJrcDataEntity(
    courseId: "",
    subCategory: "",
    subjudul: "",
    sasaran: [],
    hardSkill: [],
    softSkill: [],
    sertiPenyelesaian: "",
    sertiKelulusan: "",
    totalLowongan: 0,
    maxGaji: "0",
    minGaji: "0",
    fasilitator: FasilitatorJrcEntity(
      userId: "",
      name: "",
      avatar: "",
      namaPerusahaan: "",
      deskripsi: "",
      instagram: "",
      linkedin: "",
    ),
    instruktur: [],
    daftarLoker: [],
  ),
);
