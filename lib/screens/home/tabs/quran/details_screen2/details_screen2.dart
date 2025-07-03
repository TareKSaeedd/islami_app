import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/providers/most_recent_provider.dart';
import 'package:islami_app/screens/home/tabs/quran/details_screen1/details_screen1.dart';
import 'package:islami_app/screens/home/tabs/quran/details_screen2/sura_content_item2.dart';
import 'package:islami_app/screens/home/tabs/quran/quran_resources.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

class DetailsScreen2 extends StatefulWidget {
  const DetailsScreen2({super.key});
  static const String routeName = 'details_screen2';

  @override
  State<DetailsScreen2> createState() => _DetailsScreen2State();
}

class _DetailsScreen2State extends State<DetailsScreen2> {
  late MostRecentProvider mostRecentProvider;
  String suraContent = '';

  @override
  void dispose() {
    super.dispose();
    mostRecentProvider.readLastSuraList();
  }

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    var width = MediaQuery.of(context).size.width;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    if (suraContent.isEmpty) {
      loadSuraFile(index);
    }
    return suraContent.isEmpty
        ? Center(child: CircularProgressIndicator(color: AppColors.primaryColor))
        : Scaffold(
          appBar: AppBar(
            title: Text(QuranResources.englishQuranSurahs[index], style: AppStyles.bold20bprimary),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, DetailsScreen1.routeName, arguments: index);
                },
                icon: Icon(Icons.switch_camera_rounded, color: AppColors.primaryColor),
              ),
            ],
          ),
          body: Container(
            color: AppColors.blackColorBg,
            padding: EdgeInsets.symmetric(horizontal: width * 0.046),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppAssets.leftCorner),
                    Text(QuranResources.arabicQuranSuras[index], style: AppStyles.bold24primary),
                    Image.asset(AppAssets.rightCorner),
                  ],
                ),
                Expanded(child: SuraContentItem2(suraContent: suraContent)),
                Image.asset(AppAssets.mosqueImg),
              ],
            ),
          ),
        );
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = fileContent.split('\n');
    for (int i = 0; i < lines.length; i++) {
      lines[i] += '[${i + 1}]';
    }
    suraContent = lines.join();

    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }
}
