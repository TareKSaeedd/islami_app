import 'package:flutter/material.dart';
import 'package:islami_app/providers/sebha_provider.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var sebhaProvider = Provider.of<SebhaProvider>(context);
    return Column(
      children: [
        Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى ", style: AppStyles.bold36white),
        SizedBox(height: height * 0.018),
        GestureDetector(
          onTap: () {
            sebhaProvider.increamentSebhaCounter();
          },
          child: Stack(
            children: [
              Image.asset(AppAssets.sebha),
              Positioned(
                top: height * 0.258,
                left: width * 0.26,
                child: Column(
                  children: [
                    Text('سبحان الله', style: AppStyles.bold36white),
                    Text("${sebhaProvider.sebha_counter}", style: AppStyles.bold36white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
