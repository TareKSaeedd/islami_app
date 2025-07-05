import 'package:flutter/material.dart';
import 'package:islami_app/screens/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_app/screens/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/screens/home/tabs/radio/radio_tab.dart';
import 'package:islami_app/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/screens/home/tabs/time/time_tab.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backgroundScreens = [
    AppAssets.quranBg,
    AppAssets.hadethBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];

  List<Widget> tabs = [QuranTab(), HadethTab(), SebhaTab(), RadioTab(), TimeTab()];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgroundScreens[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: AppColors.transparentColor,
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: AppColors.primaryColor),
            child: BottomNavigationBar(
              selectedItemColor: AppColors.whiteColor,
              unselectedItemColor: AppColors.blackColor,
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  icon: buildNavigationBarItem(index: 0, imageName: AppAssets.iconQuran),
                  label: 'Quran',
                ),
                BottomNavigationBarItem(
                  icon: buildNavigationBarItem(index: 1, imageName: AppAssets.iconHadeth),
                  label: 'Hadeth',
                ),
                BottomNavigationBarItem(
                  icon: buildNavigationBarItem(index: 2, imageName: AppAssets.iconSebha),
                  label: 'Sebha',
                ),
                BottomNavigationBarItem(
                  icon: buildNavigationBarItem(index: 3, imageName: AppAssets.iconRadio),
                  label: 'Radio',
                ),
                BottomNavigationBarItem(
                  icon: buildNavigationBarItem(index: 4, imageName: AppAssets.iconTime),
                  label: 'Time',
                ),
              ],
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [Image.asset(AppAssets.logo), Expanded(child: tabs[selectedIndex])],
          ),
        ),
      ],
    );
  }

  Widget buildNavigationBarItem({required int index, required String imageName}) {
    return index == selectedIndex
        ? Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(66),
            color: AppColors.blackColorBg,
          ),
          child: ImageIcon(AssetImage(imageName)),
        )
        : ImageIcon(AssetImage(imageName));
  }
}
