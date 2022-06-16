import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/AppColors.dart';
import '../utils/AppImages.dart';
import '../utils/AppStrings.dart';
import '../utils/Constants.dart';

class MakeYourOwnPlan extends StatefulWidget {
  const MakeYourOwnPlan({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TabLayoutExampleState();
  }
}

class _TabLayoutExampleState extends State<MakeYourOwnPlan>
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
              padding: const EdgeInsets.only(left: 8),
              icon: SvgPicture.asset(AppImages.backArrow),
              onPressed: () {
                Navigator.pop(context);
              }),
          elevation: 0,
          title: Text(AppStrings.makeYourOwnPlan,
              style: AppConstant.appBarFontStyleBold),
          bottom: TabBar(
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
            isScrollable: true,
            physics: const BouncingScrollPhysics(),
            onTap: (int index) {
              debugPrint('Tab $index is tapped');
            },
            enableFeedback: true,
            tabs: _tabs,
          ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [selectPackageDropDown(), planListView()],
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

  planListView() {
    return Expanded(
      child: ListView.builder(
          itemCount: 6,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
                decoration: AppConstant.boxDecoration,
                height: 90,
                margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                padding: const EdgeInsets.only(left: 15),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.radio_button_off),
                    Text("Monthly Car Cleaning -  Exterior",
                        style: AppConstant.labelFontStyle.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.colorBlack,
                            fontSize: 14)),
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
                                Text('₹ 50',
                                    style: AppConstant.labelFontStyle.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.colorWhite,
                                        fontSize: 14)),
                                Text('Per Month',
                                    style: AppConstant.labelFontStyle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.colorWhite,
                                        fontSize: 10))
                              ],
                            )),
                        const SizedBox(height: 10),
                        Text('₹ 50',
                            style: AppConstant.labelFontStyle.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.colorBlack,
                                fontSize: 14,
                                decoration: TextDecoration.lineThrough)),
                      ],
                    ),
                  ],
                ));
          }),
    );
  }
}
