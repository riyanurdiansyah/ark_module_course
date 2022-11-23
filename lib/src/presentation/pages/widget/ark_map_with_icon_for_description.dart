import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArkMapWithIconForDescription extends StatelessWidget {
  final bool isFiturKelas;
  final String title;
  final List listUsed;

  const ArkMapWithIconForDescription(
      this.title, this.listUsed, this.isFiturKelas);
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      for (int i = 0; i < listUsed.length; i++)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              SvgPicture.asset(listUsed[i]['icon'],
                  width: isFiturKelas == true ? 55 : 14,
                  height: isFiturKelas == true ? 55 : 14),
              const SizedBox(width: 8),
              Text(listUsed[i]['title'],
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 12))
            ],
          ),
        ),
    ]);
  }
}
