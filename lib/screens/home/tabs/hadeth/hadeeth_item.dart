import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/models/hadeeth_model.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

class HadeethItem extends StatefulWidget {
  HadeethItem({super.key, required this.index});

  int index;

  @override
  State<HadeethItem> createState() => _HadeethItemState();
}

class _HadeethItemState extends State<HadeethItem> {
  HadeethModel? hadeethModel;

  @override
  void initState() {
    super.initState();
    loadHadeethFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(bottom: height * .02),
      padding: EdgeInsets.symmetric(horizontal: width * .02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor,
        image: DecorationImage(image: AssetImage('assets/images/hadeeth_background.png')),
      ),
      child:
          hadeethModel == null
              ? CircularProgressIndicator(color: AppColors.blackColorBg)
              : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/left_corner.png',
                        width: width * 0.15,
                        height: height * 0.1,
                        color: AppColors.blackColor,
                      ),
                      Expanded(
                        child: Text(
                          hadeethModel?.title ?? "",
                          style: AppStyles.bold24black,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Image.asset(
                        'assets/images/right_corner.png',
                        width: width * 0.15,
                        height: height * 0.1,
                        color: AppColors.blackColor,
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        hadeethModel?.content ?? "",
                        style: AppStyles.bold16black,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Image.asset('assets/images/hadeeth_mosque.png'),
                ],
              ),
    );
  }

  void loadHadeethFile(int index) async {
    String fileContent = await rootBundle.loadString('assets/files/hadeeth/h$index.txt');

    int fileLinesIndex = fileContent.indexOf('\n');
    String title = fileContent.substring(0, fileLinesIndex);
    String content = fileContent.substring(fileLinesIndex + 1);
    hadeethModel = HadeethModel(title: title, content: content);
    setState(() {});
  }
}
