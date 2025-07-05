import 'package:flutter/material.dart';
import 'package:islami_app/screens/home/tabs/quran/quran_resources.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_styles.dart';

class SuraItem extends StatelessWidget {
  const SuraItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.ayaNumber),
            Text('${index + 1}', style: AppStyles.bold14bwhite),
          ],
        ),
        SizedBox(width: width * .055),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(QuranResources.englishQuranSurahs[index], style: AppStyles.bold20bwhite),
            Text(QuranResources.ayaNumbers[index], style: AppStyles.bold14bwhite),
          ],
        ),
        Spacer(),
        Text(QuranResources.arabicQuranSuras[index], style: AppStyles.bold20bwhite),
      ],
    );
  }
}
