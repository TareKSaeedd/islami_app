import 'package:flutter/material.dart';
import 'package:islami_app/screens/home/tabs/quran/details_screen2/details_screen2.dart';
import 'package:islami_app/screens/home/tabs/quran/sura_item.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

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
          ),
          SizedBox(height: height * .023),
          Text('Most Recently', style: AppStyles.bold16white),
          SizedBox(height: height * .013),
          SizedBox(
            height: height * 0.17,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: width * .02),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Al-Anbiya', style: AppStyles.bold24black),
                          Text('الأنبياء', style: AppStyles.bold24black),
                          Text('112 Verses ', style: AppStyles.bold14black),
                        ],
                      ),
                      Image.asset(AppAssets.quranImg),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: width * .02);
              },
              itemCount: 10,
            ),
          ),
          SizedBox(height: height * .013),
          Text('Suras List', style: AppStyles.bold16white),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, DetailsScreen2.routeName, arguments: index);
                  },
                  child: SuraItem(index: index),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.whiteColor,
                  indent: width * 0.12,
                  endIndent: width * 0.09,
                );
              },
              itemCount: 114,
            ),
          ),
        ],
      ),
    );
  }
}
