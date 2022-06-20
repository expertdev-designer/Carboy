import 'package:carboy/ui/common_widget/CommonActionButton.dart';
import 'package:carboy/ui/utils/AppColors.dart';
import 'package:carboy/ui/utils/AppStrings.dart';
import 'package:carboy/ui/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/AppImages.dart';

class MyPackagePage extends StatefulWidget {
  const MyPackagePage({Key? key}) : super(key: key);

  @override
  State<MyPackagePage> createState() => _MyPackagePageState();
}

class _MyPackagePageState extends State<MyPackagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: myPackageListView(),
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
      title:
          Text(AppStrings.myPackages, style: AppConstant.appBarFontStyleBold),
    );
  }

  myPackageListView() {
    List<String> text = [
      "15  alternate days",
      "Daily Car Cleaning- Exterior",
      "Vaccum every Sunday",
    ];
    return ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 20),
        itemBuilder: (context, index) {
          return Container(
              decoration: AppConstant.boxDecoration.copyWith(
                  color: Colors.white,
                  border: Border.all(color: Colors.transparent),
                  boxShadow: [
                    const BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.11),
                        offset: Offset(0, 2),
                        blurRadius: 3)
                  ]),
              margin: const EdgeInsets.only(right: 24, left: 24, bottom: 20),
              padding: const EdgeInsets.only(left: 15, top: 12, bottom: 12),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: index == 0 ? 0 : 6, vertical: 2),
                            decoration: index != 0
                                ? AppConstant.boxDecoration.copyWith(
                                    color: const Color(0xFFFFF4F3),
                                    borderRadius: BorderRadius.circular(3),
                                    boxShadow: [
                                      const BoxShadow(color: Colors.white)
                                    ],
                                    border: Border.all(
                                        color: AppColors.colorRewWithOpacity))
                                : const BoxDecoration(),
                            child: Text(
                                index == 0 ? AppStrings.currentPlan : "Expired",
                                style: AppConstant.labelFontStyle.copyWith(
                                    fontWeight: index == 0
                                        ? FontWeight.w500
                                        : FontWeight.w600,
                                    color: AppColors.colorBlack,
                                    fontSize: 10)),
                          ),
                          Text(index == 1 ? "Silver Plan" : "Economic Plan",
                              style: AppConstant.labelFontStyle.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.colorBlack,
                                  fontSize: 18)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(AppStrings.expiryDate,
                                style: AppConstant.labelFontStyle.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.colorBlack,
                                    fontSize: 10)),
                            Text("10 Feb 2022",
                                style: AppConstant.labelFontStyle.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.colorBlack,
                                    fontSize: 18)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          for (var i in text)
                            Row(
                              children: [
                                Container(
                                    height: 4,
                                    width: 4,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.textColorGray)),
                                const SizedBox(width: 8),
                                Text(i.toString(),
                                    style: AppConstant.labelFontStyle.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textColorGray,
                                        height: 1.3,
                                        fontSize: 13)),
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
                                horizontal: 20, vertical: 6),
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
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Vehicle No : TT 01 AT 4926",
                          style: AppConstant.labelFontStyle.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor,
                              fontSize: 13)),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(index == 1 ? '₹ 500' : "200",
                            style: AppConstant.labelFontStyle.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.colorBlack,
                                fontSize: 15,
                                decoration: TextDecoration.lineThrough)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  index == 0 ? _addOns() : _renewPlanChangePlan()
                ],
              ));
        });
  }

  Widget _addOns() {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          const SizedBox(
            height: 24,
            width: 24,
            child: CircleAvatar(
                backgroundColor: AppColors.colorGreen,
                child: Icon(Icons.add, size: 20, color: Colors.white)),
          ),
          const SizedBox(width: 10),
          Text(AppStrings.addOns,
              style: AppConstant.labelFontStyle.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.colorBlack,
                  decoration: TextDecoration.underline,
                  fontSize: 13)),
        ],
      ),
    );
  }

  _renewPlanChangePlan() {
    return Row(
      children: [
        Expanded(
          child: CommonActionButtonWidget(
            onPressed: () {},
            text: AppStrings.renewPlan,
            height: 40,
            buttonFontStyle: AppConstant.buttonFontStyle.copyWith(fontSize: 13),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CommonActionButtonWidget(
              text: AppStrings.changePackage,
              height: 40,
              onPressed: () {},
              buttonColor: AppColors.colorGreen,
              buttonFontStyle: AppConstant.buttonFontStyle.copyWith(
                fontSize: 13,
              )),
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
