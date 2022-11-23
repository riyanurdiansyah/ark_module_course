import 'package:intl/intl.dart';
import 'package:html/parser.dart';
import 'package:dio/dio.dart';

NumberFormat numberFormat = NumberFormat.decimalPattern('id');

String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body!.text).documentElement!.text;

  return parsedString;
}

final currencyFormatter = NumberFormat.currency(
  locale: "id_ID",
  symbol: "Rp ",
  decimalDigits: 0,
);

//height testedPhone

//ini iphone riki kecil bgt
const double height533Pixel = 532;
const double height676Pixel = 675;

//ini nexus 5x
const double height683Pixel = 682;
const double height737Pixel = 736;
const double height781Pixel = 780;
const double height820Pixel = 819;

//width testedPhone

//ini iphone riki kecil bgt
const double width320Pixel = 321;
const double width360Pixel = 361;

Options globalOptions({
  Map<String, dynamic>? headers,
}) {
  return Options(
    followRedirects: false,
    validateStatus: (status) => true,
    headers: headers ?? {},
  );
}

const List<Map<String, String>> fiturKelas = [
  {'icon': 'assets/images/icon-online-kelas.svg', 'title': '100% Online'},
  {
    'icon': 'assets/images/icon-tersedia-app.svg',
    'title': 'Tersedia dalam App dan Web'
  },
  {'icon': 'assets/images/icon-jadwal.svg', 'title': 'Jadwal fleksibel'},
];
