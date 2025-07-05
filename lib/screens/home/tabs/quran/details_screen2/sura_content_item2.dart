import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_styles.dart';

class SuraContentItem2 extends StatelessWidget {
  const SuraContentItem2({super.key, required this.suraContent});

  final String suraContent;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Text(
        ' $suraContent',
        style: AppStyles.bold20bprimary.copyWith(height: 2),
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
