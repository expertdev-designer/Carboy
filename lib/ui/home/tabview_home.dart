import 'package:carboy/ui/common_widget/InnerShadow.dart';
import 'package:carboy/ui/utils/AppColors.dart';
import 'package:carboy/ui/utils/AppImages.dart';
import 'package:carboy/ui/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../make_own_plan/make_own_plan.dart';
import '../utils/AppStrings.dart';

class TabViewHome extends StatefulWidget {
  const TabViewHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TabViewHomeState();
  }
}

class _TabViewHomeState extends State<TabViewHome>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _tabController.animateTo(2);
  }

  static const List<Tab> _tabs = [
    Tab(child: Text('Hatchback')),
    Tab(text: 'Sedan'),
    Tab(text: 'SUV'),
    Tab(text: 'Big SUV'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: TabBar(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black,
          labelStyle: AppConstant.tabSelectedFontStyle,
          unselectedLabelStyle: AppConstant.tabUnselectedFontStyle,
          overlayColor:
              MaterialStateColor.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return AppColors.primaryColor.withOpacity(0.5);
            }
            if (states.contains(MaterialState.focused)) {
              return Colors.orange;
            } else if (states.contains(MaterialState.hovered)) {
              return Colors.pinkAccent;
            }

            return Colors.transparent;
          }),
          indicatorWeight: 4,
          indicatorColor: AppColors.primaryColor,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: const EdgeInsets.all(5),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          // indicator: BoxDecoration(
          //   border: Border.all(color: Colors.red),
          //   borderRadius: BorderRadius.circular(10),
          //   color: Colors.pinkAccent,
          // ),
          isScrollable: true,
          physics: const BouncingScrollPhysics(),
          onTap: (int index) {
            debugPrint('Tab $index is tapped');
          },
          enableFeedback: true,
          // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
          // controller: _tabController,
          tabs: _tabs,
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
          // controller: _tabController,
          children: [
            tabView(),
            tabView(),
            tabView(),
            tabView(),
          ],
        ),
      ),
    );
  }

  tabView() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          selectPackageDropDown(),
          makeYourOwnPlan(),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
            child: Text(
              AppStrings.individualPlan,
              style: AppConstant.labelFontStyle.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.colorBlack,
                  fontSize: 18),
            ),
          ),
          individualPlanListView(),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
            child: Text(
              AppStrings.ourTailor,
              style: AppConstant.labelFontStyle.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.colorBlack,
                  fontSize: 18),
            ),
          ),
          ourTailorListView()
        ],
      ),
    );
  }

  Widget selectPackageDropDown() {
    String chooseSociety = "Package - Small Hatchback";

    List<String> dataList = [
      "Package - Big Hatchback",
      "Package - Small Hatchback",
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(width: 1, color: AppColors.pinBorderColor),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.19), // darker color
              ),
              BoxShadow(
                  color: Colors.white, // background color
                  blurRadius: 9.0,
                  offset: Offset(0, 1)),
            ]),
        child: FormField<String>(
          builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: const InputDecoration(
                  // filled: true,
                  contentPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  border: InputBorder.none),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  style: AppConstant.labelFontStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                  hint: Text("Select Vehicle",
                      style: AppConstant.labelFontStyle.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.black)),
                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  value: chooseSociety,
                  isExpanded: true,
                  isDense: true,
                  onChanged: (String? newValue) {
                    setState(() {
                      chooseSociety = newValue!;
                    });
                  },
                  items: dataList
                      .map<DropdownMenuItem<String>>((String valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 15),
                          Text(valueItem),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget makeYourOwnPlan() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
              height: 100,
              decoration: AppConstant.boxDecoration,
              margin: const EdgeInsets.only(right: 20, left: 20),
              padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.makeYourOwnPlan,
                    style: AppConstant.labelFontStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.colorBlack,
                        fontSize: 18),
                  ),
                  InkWell(
                    onTap: ()
                    {
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=>const MakeYourOwnPlan()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                      decoration: AppConstant.boxDecoration.copyWith(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColors.primaryColor)),
                      child: Text(
                        AppStrings.letsGetStarted,
                        style: AppConstant.labelFontStyle.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.colorWhite,
                            fontSize: 13),
                      ),
                    ),
                  ),
                ],
              )),
        ),
        Column(
          children: [
            Container(
              height: 45,
              width: 45,
              padding: const EdgeInsets.all(4),
              decoration: AppConstant.boxDecoration,
              child: SvgPicture.asset(AppImages.whatsAppIcon),
            ),
            const SizedBox(height: 10),
            Container(
              height: 45,
              width: 45,
              padding: const EdgeInsets.all(4),
              decoration: AppConstant.boxDecoration
                  .copyWith(border: Border.all(color: Color(0xFF7DAFFF))),
              child: SvgPicture.asset(AppImages.callingIcon),
            )
          ],
        )
      ],
    );
  }

  individualPlanListView() {
    return SizedBox(
      height: 90,
      width: double.maxFinite,
      child: ListView.builder(
          itemCount: 6,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
                decoration: AppConstant.boxDecoration,
                height: 90,
                margin: const EdgeInsets.only(right: 0, left: 20),
                padding: const EdgeInsets.only(left: 15),
                width: MediaQuery.of(context).size.width - 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.carWash,
                      style: AppConstant.labelFontStyle.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.colorBlack,
                          fontSize: 18),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: AppConstant.blackBoxDecoration,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '₹ 50',
                                style: AppConstant.labelFontStyle.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.colorWhite,
                                    fontSize: 14),
                              ),
                              Text(
                                'Per Month',
                                style: AppConstant.labelFontStyle.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.colorWhite,
                                    fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '₹ 50',
                          style: AppConstant.labelFontStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.colorBlack,
                              fontSize: 14,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                  ],
                ));
          }),
    );
  }

  ourTailorListView() {
    List<String> text = [
      "15  alternate days",
      "Daily Car Cleaning- Exterior",
      "Vaccum every Sunday",
    ];
    return ListView.builder(
        itemCount: 6,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: AppConstant.boxDecoration,
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      index == 1 ? "Silver Plan" : "Economic Plan",
                      style: AppConstant.labelFontStyle.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.colorBlack,
                          fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    for (var i in text)
                      Row(
                        children: [
                          Container(
                            height: 4,
                            width: 4,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.textColorGray),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            i.toString(),
                            style: AppConstant.labelFontStyle.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.textColorGray,
                                fontSize: 13),
                          ),
                        ],
                      )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 6),
                      decoration: AppConstant.blackBoxDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(index == 1 ? "₹ 400" : '₹ 100',
                              style: AppConstant.labelFontStyle.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.colorWhite,
                                  fontSize: 14)),
                          Text('Per Month',
                              style: AppConstant.labelFontStyle.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.colorWhite,
                                  fontSize: 10)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(index == 1 ? '₹ 500' : "200",
                        style: AppConstant.labelFontStyle.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.colorBlack,
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough)),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
