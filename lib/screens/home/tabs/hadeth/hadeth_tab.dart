import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/screens/home/tabs/hadeth/hadeeth_item.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return CarouselSlider(
      options: CarouselOptions(
        height: height * .66,
        enlargeCenterPage: true,
        aspectRatio: 618 / 313,
      ),
      items: // generate a list of 50 index starts from index 1
          List.generate(50, (index) => index + 1).map((index) {
            return HadeethItem(index: index);
          }).toList(),
    );
  }
}
