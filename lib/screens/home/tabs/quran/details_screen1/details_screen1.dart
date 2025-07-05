import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/screens/home/tabs/quran/details_screen1/sura_content_item.dart';
import 'package:islami_app/screens/home/tabs/quran/quran_resources.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class DetailsScreen1 extends StatefulWidget {
  const DetailsScreen1({super.key});
  static const String routeName = 'details_screen1';

  @override
  State<DetailsScreen1> createState() => _DetailsScreen1State();
}

class _DetailsScreen1State extends State<DetailsScreen1> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    if (verses.isEmpty) {
      loadSuraFile(index);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(QuranResources.englishQuranSurahs[index], style: AppStyles.bold20bprimary),
      ),
      body:
          verses.isEmpty
              ? Center(child: CircularProgressIndicator(color: AppColors.primaryColor))
              : Container(
                color: AppColors.blackColorBg,
                padding: EdgeInsets.symmetric(horizontal: width * 0.046),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(AppAssets.leftCorner),
                        Text(
                          QuranResources.arabicQuranSuras[index],
                          style: AppStyles.bold24primary,
                        ),
                        Image.asset(AppAssets.rightCorner),
                      ],
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return SuraContentItem(index: index, verses: verses);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: height * 0.008);
                        },
                        itemCount: verses.length,
                      ),
                    ),
                    Image.asset(AppAssets.mosqueImg),
                  ],
                ),
              ),
    );
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = fileContent.split('\n');
    verses = lines;
    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }
}
