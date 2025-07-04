import 'package:flutter/material.dart';

class SebhaProvider extends ChangeNotifier {
  int sebhaCounter = 0;
  String tsbehZikr = "سبحان الله";

  void increamentSebhaCounter() {
    sebhaCounter++;
    if (sebhaCounter == 34) {
      tsbehZikr = "الحمد لله";
    } else if (sebhaCounter == 67) {
      tsbehZikr = "الله أكبر";
    }
    notifyListeners();
  }
}
