import 'package:ark_module_course/src/presentation/pages/widget/ark_image_network_with_title.dart';
import 'package:flutter/material.dart';

class ArkSertifikatJrc extends StatelessWidget {
  final String imagePenyelesaianUrl;
  final String imageKompetensiUrl;

  const ArkSertifikatJrc(
      {Key? key,
      required this.imageKompetensiUrl,
      required this.imagePenyelesaianUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'E-Sertifikat',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
        ),
        ArkImageNetworkWithTitle(
            text: 'Sertifikat Penyelesaian',
            imageUrl: imagePenyelesaianUrl,
            messageTooltip:
                'Akan kamu dapatkan setelah menyelesaikan seluruh rangkaian kursus ini'),
        const SizedBox(height: 8),
        ArkImageNetworkWithTitle(
            text: 'Sertifikat Kompetensi Lulusan',
            imageUrl: imageKompetensiUrl,
            messageTooltip:
                'Akan kamu dapatkan setelah dinyatakan lulus dari ujian akhir'),
      ],
    );
  }
}
