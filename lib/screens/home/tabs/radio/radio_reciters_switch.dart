import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_styles.dart';

class RadioRecitersSwitch extends StatelessWidget {
  const RadioRecitersSwitch({
    super.key,
    required this.titel,
    required this.containerColor,
    this.textStyle,
  });
  final String titel;
  final Color containerColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: containerColor),
      width: width * 0.43,
      height: height * 0.04,
      child: Text(titel, style: textStyle ?? AppStyles.bold16black),
    );
  }
}
