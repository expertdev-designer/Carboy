import 'package:carboy/ui/common_widget/CommonActionButton.dart';
import 'package:carboy/ui/utils/AppColors.dart';
import 'package:carboy/ui/utils/AppStrings.dart';
import 'package:carboy/ui/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/AppImages.dart';

class MyProfiePage extends StatefulWidget {
  const MyProfiePage({Key? key}) : super(key: key);

  @override
  State<MyProfiePage> createState() => _MyProfiePageState();
}

class _MyProfiePageState extends State<MyProfiePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
    );
  }

  appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.colorWhite,
      leading: IconButton(
          padding: const EdgeInsets.only(left: 8),
          icon: SvgPicture.asset(AppImages.backArrow),
          onPressed: () {
            Navigator.pop(context);
          }),
      centerTitle: true,
      title: Text(AppStrings.profile, style: AppConstant.appBarFontStyleBold),
    );
  }
}
