import 'package:carboy/ui/utils/AppColors.dart';
import 'package:flutter/material.dart';

class AppConstant {
  static const fontStyleLight = TextStyle(
      fontWeight: FontWeight.w300,
      color: AppColors.colorBlack,
      fontSize: 16,
      fontFamily: "Poppins");

  static TextStyle fontStyleRegular = const TextStyle(
      fontWeight: FontWeight.w400,
      color: AppColors.colorBlack,
      fontSize: 14,
      fontFamily: "Poppins");

  static TextStyle appBarFontStyleBold = const TextStyle(
      fontWeight: FontWeight.w600,
      color: AppColors.colorBlack,
      fontSize: 19,
      fontFamily: "Poppins");

  static const fontStyleSemiBold = TextStyle(
      fontWeight: FontWeight.w600,
      color: AppColors.colorBlack,
      fontSize: 16,
      fontFamily: "Poppins");

  static const fontStyleMediumBold = TextStyle(
      fontWeight: FontWeight.w500,
      color: AppColors.colorBlack,
      fontSize: 16,
      fontFamily: "Poppins");

  static const buttonFontStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: AppColors.colorWhite,
      fontSize: 16,
      fontFamily: "Poppins");

  static TextStyle labelFontStyle = TextStyle(
      fontWeight: FontWeight.w400,
      color: AppColors.colorBlack.withOpacity(0.65),
      fontSize: 14,
      fontFamily: "Poppins");

  static const tabSelectedFontStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: AppColors.colorBlack,
      fontSize: 12,
      fontFamily: "Poppins");

  static const tabUnselectedFontStyle = TextStyle(
      fontWeight: FontWeight.w500,
      color: AppColors.colorBlack,
      fontSize: 12,
      fontFamily: "Poppins");

  static BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(width: 1, color: AppColors.colorGreen),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
            color: Color.fromRGBO(19, 192, 47, 0.38),
            offset: Offset(0, 2),
            blurRadius: 3,
            spreadRadius: 0)
      ]);

  static BoxDecoration blackBoxDecoration = const BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
      color: Colors.black);
}
