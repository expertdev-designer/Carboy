import 'package:carboy/ui/common_widget/CommonActionButton.dart';
import 'package:carboy/ui/utils/AppColors.dart';
import 'package:carboy/ui/utils/AppStrings.dart';
import 'package:carboy/ui/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/AppImages.dart';

class TermConditionPrivacyPolicyPage extends StatefulWidget {
  final String? title;

  const TermConditionPrivacyPolicyPage({Key? key, this.title})
      : super(key: key);

  @override
  State<TermConditionPrivacyPolicyPage> createState() =>
      _TermConditionPrivacyPolicyPageState();
}

class _TermConditionPrivacyPolicyPageState
    extends State<TermConditionPrivacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: body(),
      ),
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
      title: Text(widget.title ?? "", style: AppConstant.appBarFontStyleBold),
    );
  }

  body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Text(
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
        style: AppConstant.labelFontStyle.copyWith(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 14,
            height: 1.8,
            letterSpacing: 2),
      ),
    );
  }
}
