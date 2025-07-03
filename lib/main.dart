import 'package:flutter/material.dart';
import 'package:islami_app/providers/most_recent_provider.dart';
import 'package:islami_app/screens/home/home_screen.dart';
import 'package:islami_app/screens/home/tabs/quran/details_screen1/details_screen1.dart';
import 'package:islami_app/screens/home/tabs/quran/details_screen2/details_screen2.dart';
import 'package:islami_app/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => MostRecentProvider(), child: const IslamiApp()),
  );
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        DetailsScreen1.routeName: (context) => DetailsScreen1(),
        DetailsScreen2.routeName: (context) => DetailsScreen2(),
      },
      darkTheme:
          AppTheme
              .darkTheme, // here I am specifying the properties or the options of the dark theme
      themeMode: ThemeMode.dark, //here I am telling the app that it will be dark theme
    );
  }
}
