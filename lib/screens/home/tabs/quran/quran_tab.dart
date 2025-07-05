import 'package:flutter/material.dart';
import 'package:islami_app/screens/home/tabs/quran/details_screen2/details_screen2.dart';
import 'package:islami_app/screens/home/tabs/quran/most_recent_widget.dart';
import 'package:islami_app/screens/home/tabs/quran/quran_resources.dart';
import 'package:islami_app/screens/home/tabs/quran/sura_item.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/shared_preference.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style: AppStyles.bold16white,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Image.asset(
                'assets/images/icon_quran.png',
                color: AppColors.primaryColor,
              ),
              hintText: 'Sura Name',
              hintStyle: AppStyles.bold16white,
            ),

            onChanged: (newText) {
              searchFilterList(newText);
            },
          ),
          SizedBox(height: height * .023),
          MostRecentWidget(),
          SizedBox(height: height * .013),
          Text('Suras List', style: AppStyles.bold16white),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //Todo : save last sure index
                    saveLastSuraIndex(filterList[index]);
                    Navigator.pushNamed(
                      context,
                      DetailsScreen2.routeName,
                      arguments: filterList[index],
                    );
                  },
                  child: SuraItem(index: filterList[index]),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.whiteColor,
                  indent: width * 0.12,
                  endIndent: width * 0.09,
                );
              },
              itemCount: filterList.length,
            ),
          ),
        ],
      ),
    );
  }

  void searchFilterList(String newText) {
    List<int> searchFilterList = [];

    for (int i = 0; i < QuranResources.arabicQuranSuras.length; i++) {
      if (QuranResources.arabicQuranSuras[i].toLowerCase().contains(newText)) {
        searchFilterList.add(i);
      } else if (QuranResources.englishQuranSurahs[i].toLowerCase().contains(newText)) {
        searchFilterList.add(i);
      }
    }
    filterList = searchFilterList;
    setState(() {});
  }
}
