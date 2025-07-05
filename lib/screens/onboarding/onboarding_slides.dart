import 'package:flutter/material.dart';
import 'package:islami_app/screens/home/home_screen.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class OnboardingSlides extends StatefulWidget {
  OnboardingSlides({
    super.key,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.pageController,
  });

  int index;
  String title;
  String subtitle;
  PageController pageController;

  @override
  State<OnboardingSlides> createState() => _OnboardingSlidesState();
}

class _OnboardingSlidesState extends State<OnboardingSlides> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Image.asset("assets/images/onboarding${widget.index + 1}.png"),
        SizedBox(height: height * 0.075),
        Text(widget.title, style: AppStyles.bold20bprimary),
        SizedBox(height: height * 0.042),
        Text(widget.subtitle, style: AppStyles.bold20bprimary, textAlign: TextAlign.center),
        Spacer(),
        Container(
          padding: EdgeInsets.only(
            bottom: height * 0.029,
            left: width * 0.037,
            right: width * 0.037,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: widget.index > 0,
                child: GestureDetector(
                  onTap: () {
                    widget.pageController.animateToPage(
                      widget.index - 1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Text('Back', style: AppStyles.bold16primary),
                ),
              ),
              dotsScroll(index: widget.index),
              GestureDetector(
                onTap: () {
                  widget.pageController.animateToPage(
                    widget.index + 1,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                },
                child:
                    widget.index == 4
                        ? TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                          },
                          child: Text('Finish', style: AppStyles.bold16primary),
                        )
                        : Text('Next', style: AppStyles.bold16primary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget dotsScroll({required int index}) {
  return Row(
    children: [
      for (int i = 0; i < 5; i++)
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: i == index ? AppColors.primaryColor : AppColors.grayColor,
            borderRadius: BorderRadius.circular(50),
          ),
          width: i == index ? 16 : 7,
          height: 7,
        ),
    ],
  );
}
