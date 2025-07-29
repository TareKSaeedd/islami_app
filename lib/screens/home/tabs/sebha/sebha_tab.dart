import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_styles.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> Azkar = ['سبحان الله', 'الحمد لله', 'الله أكبر'];
  int counter = 0;
  int index = 0;
  double angel = 1;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    // var sebhaProvider = Provider.of<SebhaProvider>(context);
    return Column(
      children: [
        Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى ", style: AppStyles.bold36white),
        SizedBox(height: height * 0.018),
        GestureDetector(
          onTap: () {
            // sebhaProvider.increamentSebhaCounter();
            increamentTsbeh();
          },
          child: Stack(
            children: [
              Positioned(left: width * 0.42, child: Image.asset(AppAssets.sebhaHead)),
              Container(
                padding: EdgeInsets.only(top: height * .09),
                child: Transform.rotate(angle: angel, child: Image.asset(AppAssets.sebhaBody)),
              ),
              Positioned(
                top: height * 0.258,
                left: width * 0.26,
                child: Column(
                  children: [
                    Text(Azkar[index], style: AppStyles.bold36white),
                    Text("$counter", style: AppStyles.bold36white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void increamentTsbeh() {
    counter++;
    if (counter == 33) {
      index = (index + 1) % Azkar.length;
      counter = 0;
    }
    angel++;

    setState(() {});
  }
}
