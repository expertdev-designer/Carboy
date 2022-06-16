import 'package:carboy/ui/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/AppColors.dart';

class CommonActionButtonWidget extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  bool? isProgressShown;

  CommonActionButtonWidget(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.isProgressShown})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            begin: Alignment(-0.95, 0.0),
            end: Alignment(1.0, 0.0),
            colors: [
              AppColors.gradientColorFirst,
              AppColors.gradientColorSecond
            ],
            stops: [0.0, 1.0],
          ),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.13),
                blurRadius: 40,
                offset: Offset(0, 20))
          ]),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              onSurface: Colors.transparent,
              shadowColor: Colors.transparent),
          onPressed: onPressed,
          child: Center(
            child: isProgressShown == true
                ? const SpinKitCircle(color: AppColors.colorWhite, size: 50.0)
                : Text(text ?? "", style: AppConstant.buttonFontStyle),
          )),
    );
  }
}
