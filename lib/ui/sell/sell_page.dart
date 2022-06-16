import 'package:carboy/ui/common_widget/CommonActionButton.dart';
import 'package:carboy/ui/utils/AppImages.dart';
import 'package:carboy/ui/utils/AppStrings.dart';
import 'package:carboy/ui/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/AppColors.dart';

class SellPage extends StatefulWidget {
  const SellPage({Key? key}) : super(key: key);

  @override
  State<SellPage> createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(AppImages.sellBg,
            fit: BoxFit.fill,
            width: double.maxFinite,
            height: double.maxFinite),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(AppStrings.sellText,
                    textAlign: TextAlign.center,
                    style: AppConstant.labelFontStyle.copyWith(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        color: AppColors.colorWhite))),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CommonActionButtonWidget(
                      text: AppStrings.enquiry,
                      isProgressShown: false,
                      onPressed: () {}),
                )),
          ],
        )
      ],
    );
  }
}
