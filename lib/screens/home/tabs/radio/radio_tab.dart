import 'package:flutter/material.dart';
import 'package:islami_app/screens/home/tabs/radio/radio_player.dart';
import 'package:islami_app/screens/home/tabs/radio/radio_reciters_switch.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RadioRecitersSwitch(titel: 'Radio', containerColor: AppColors.primaryColor),
            RadioRecitersSwitch(
              titel: 'Reciters',
              containerColor: AppColors.blackColor.withOpacity(.7),
              textStyle: AppStyles.bold16white,
            ),
          ],
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return RadioPlayer(index: index);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: height * 0.018);
            },
            itemCount: 4,
          ),
        ),
      ],
    );
  }
}
