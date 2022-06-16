import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common_widget/CommonActionButton.dart';
import '../utils/AppColors.dart';
import '../utils/AppImages.dart';
import '../utils/AppStrings.dart';
import '../utils/Constants.dart';

class InsurancePage extends StatefulWidget {
  const InsurancePage({Key? key}) : super(key: key);

  @override
  State<InsurancePage> createState() => _InsurancePageState();
}

class _InsurancePageState extends State<InsurancePage> {
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        SvgPicture.asset(AppImages.insuranceBg,
            fit: BoxFit.fill,
            width: double.maxFinite,
            height: double.maxFinite),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(AppStrings.insuranceText,
                    textAlign: TextAlign.center,
                    style: AppConstant.labelFontStyle.copyWith(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        color: AppColors.colorWhite))),
            SizedBox(height: MediaQuery.of(context).size.height * 0.22),
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
