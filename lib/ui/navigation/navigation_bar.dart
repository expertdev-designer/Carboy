import 'package:carboy/ui/home/home_page.dart';
import 'package:carboy/ui/insurance/insurance_page.dart';
import 'package:carboy/ui/sell/sell_page.dart';
import 'package:carboy/ui/utils/AppColors.dart';
import 'package:carboy/ui/utils/AppImages.dart';
import 'package:carboy/ui/utils/Constants.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../settings/settings_page.dart';
import 'MyDotNavigationBar.dart';

class CarBoyNavigationBar extends StatefulWidget {
  const CarBoyNavigationBar({Key? key}) : super(key: key);

  @override
  State<CarBoyNavigationBar> createState() => _CarBoyNavigationBarState();
}

enum _SelectedTab { home, sell, insurance, profile}

class _CarBoyNavigationBarState extends State<CarBoyNavigationBar> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text(
            _selectedTab.index == 0
                ? "Home"
                : _selectedTab.index == 1
                    ? "Sell"
                    : _selectedTab.index == 2
                        ? "Insurance"
                        : "Settings",
            style: AppConstant.appBarFontStyleBold,
          )),
      body: IndexedStack(index: _selectedTab.index, children: const [
        HomePage(),
        SellPage(),
        InsurancePage(),
        SettingPage()
      ]),
      bottomNavigationBar: MyDotNavigationBar(
        boxShadow: const [
          BoxShadow(
              blurRadius: 13,
              color: Color.fromRGBO(0, 0, 0, 0.3),
              spreadRadius: 0,
              offset: Offset(0, 5))
        ],
        selectedItemColor: AppColors.colorBlack,
        unselectedItemColor: AppColors.colorBlack,
        dotIndicatorColor: AppColors.primaryColor,
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),

        onTap: _handleIndexChanged,
        // dotIndicatorColor: Colors.black,
        items: [
          /// Home
          DotNavigationBarItem(
              icon: SvgPicture.asset(AppImages.homeTabIcon,
                  height: 22, width: 24)),

          /// Sell
          DotNavigationBarItem(
              icon: SvgPicture.asset(AppImages.sellTabIcon,
                  height: 22, width: 26)),

          /// Insurance
          DotNavigationBarItem(
              icon: SvgPicture.asset(AppImages.insuranceTabIcon,
                  height: 22, width: 26)),

          /// Setting
          DotNavigationBarItem(
              icon: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: SvgPicture.asset(AppImages.settingTabIcon,
                height: 26, width: 26),
          )),
        ],
      ),
    );
  }
}
