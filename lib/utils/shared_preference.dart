import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceKeys {
  static const mostRecentKey = 'most_recent';
}

void saveLastSuraIndex(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // get List from S.P
  List<String> mostRecentIndeciesList =
      prefs.getStringList(SharedPreferenceKeys.mostRecentKey) ?? [];
  //add new index in the list
  // mostRecentIndeciesList.add('$newSuraIndex');

  // duplicate
  if (mostRecentIndeciesList.contains('$newSuraIndex')) {
    mostRecentIndeciesList.remove('$newSuraIndex');
    mostRecentIndeciesList.insert(0, '$newSuraIndex');
  } else {
    mostRecentIndeciesList.insert(0, '$newSuraIndex');
  }

  //condition to be just 5 suras
  if (mostRecentIndeciesList.length > 5) {
    mostRecentIndeciesList.removeLast();
    // mostRecentIndeciesList.insert(0, '$newSuraIndex');
  }

  //save new sura index
  prefs.setStringList(SharedPreferenceKeys.mostRecentKey, mostRecentIndeciesList);
}
