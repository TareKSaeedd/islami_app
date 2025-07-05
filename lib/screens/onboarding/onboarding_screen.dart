import 'package:flutter/material.dart';
import 'package:islami_app/screens/onboarding/onboarding_slides.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  static const routeName = 'onboarding_screen';
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    List<String> titleList = [
      "",
      "Welcome To Islami",
      "Reading the Quran",
      "Bearish",
      "Holy Quran Radio",
    ];
    List<String> subtitleList = [
      "Welcome To Islmi App",
      "We Are Very Excited To Have You In Our Community",
      "Read, and your Lord is the Most Generous",
      "Praise the name of your Lord, the Most High",
      "You can listen to the Holy Quran Radio through the application for free and easily",
    ];
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Column(
          children: [
            Image.asset(AppAssets.logo),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemBuilder: (context, index) {
                  return OnboardingSlides(
                    index: index,
                    pageController: pageController,
                    title: titleList[index],
                    subtitle: subtitleList[index],
                  );
                },
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
