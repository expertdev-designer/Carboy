import 'package:carboy/ui/common_widget/CommonActionButton.dart';
import 'package:carboy/ui/settings/my_package.dart';
import 'package:carboy/ui/settings/my_profile.dart';
import 'package:carboy/ui/settings/tc_pp_page.dart';
import 'package:carboy/ui/settings/transaction_history.dart';
import 'package:carboy/ui/utils/AppColors.dart';
import 'package:carboy/ui/utils/AppStrings.dart';
import 'package:carboy/ui/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  List<String> listItem = [
    AppStrings.profile,
    AppStrings.myPackages,
    AppStrings.transactionHistory,
    AppStrings.tc,
    AppStrings.pp,
    AppStrings.logout
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [_listView(), _logInButton()]);
  }

  _listView() {
    return ListView.separated(
      itemCount: listItem.length,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemBuilder: (context, index) {
        return ListTile(
            onTap: () {
              switch (index) {
                case 0:
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const MyProfiePage()));
                  break;
                case 1:
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const MyPackagePage()));
                  break;
                case 2:
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              const TransactionHistoryPage()));
                  break;
                case 3:
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              const TermConditionPrivacyPolicyPage(
                                  title: AppStrings.tc)));
                  break;
                case 4:
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              const TermConditionPrivacyPolicyPage(
                                  title: AppStrings.pp)));
                  break;
              }
            },
            title: Text(
              listItem[index],
              style: AppConstant.labelFontStyle.copyWith(
                  color: AppColors.colorBlack,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ));
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(thickness: 1, endIndent: 10, indent: 10);
      },
    );
  }

  _logInButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
      child: CommonActionButtonWidget(
          text: AppStrings.login.toUpperCase(), onPressed: () {}),
    );
  }
}
