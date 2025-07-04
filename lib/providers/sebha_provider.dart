import 'package:flutter/material.dart';

class SebhaProvider extends ChangeNotifier {
  int sebha_counter = 0;

  void increamentSebhaCounter() {
    sebha_counter++;
    notifyListeners();
  }
}
