import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class RadioPlayer extends StatelessWidget {
  RadioPlayer({super.key, required this.index});
  int index = 0;

  @override
  Widget build(BuildContext context) {
    List<String> recitersName = [
      "Radio Ibrahim Al-Akdar",
      "Radio Al-Qaria Yassen",
      "Radio Ahmed Al-trabulsi",
      "Radio Addokali Mohammad Alalim",
    ];
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.0465),
      width: width * 0.9,
      height: height * 0.156,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            left: width * .2,
            top: height * 0.02,
            child: Text(recitersName[index], style: AppStyles.bold20black),
          ),
          Align(alignment: Alignment.bottomCenter, child: Image.asset(AppAssets.radioMosque)),
          Positioned(
            bottom: height * 0.015,
            left: width * 0.38,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.play_arrow),
                  iconSize: 44,
                  color: AppColors.blackColor,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.volume_up),
                  iconSize: 28,
                  color: AppColors.blackColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
