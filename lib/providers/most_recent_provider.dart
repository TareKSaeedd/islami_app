import 'package:flutter/material.dart';
import 'package:islami_app/utils/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> mostRecentList = [];

  void readLastSuraList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //get the list saved
    List<String> mostRecentIndicesAsString =
        prefs.getStringList(SharedPreferenceKeys.mostRecentKey) ?? [];

    List<int> mostRecentIndicesAsInt =
        mostRecentIndicesAsString.map((element) => int.parse(element)).toList();

    mostRecentList = mostRecentIndicesAsInt;

    notifyListeners();
  }
}
