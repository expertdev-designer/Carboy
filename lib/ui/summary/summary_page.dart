import 'package:carboy/ui/common_widget/CommonActionButton.dart';
import 'package:carboy/ui/utils/AppColors.dart';
import 'package:carboy/ui/utils/AppStrings.dart';
import 'package:carboy/ui/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common_widget/common_textField.dart';
import '../utils/AppImages.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myPackageView(),
                    const SizedBox(height: 20),
                    startFromTextField(),
                    const SizedBox(height: 20),
                    selectTimeSlotTextField(),
                    const SizedBox(height: 20),
                    enterVehicleNO(),
                    const SizedBox(height: 20),
                    selectManufacturer(),
                    const SizedBox(height: 20),
                    selectModel(),
                    const SizedBox(height: 20),
                    enterCouponCode(),
                    const SizedBox(height: 20),
                    subscriptionText(),
                    const SizedBox(height: 20),
                    Text(AppStrings.rcUpload,
                        style: AppConstant.labelFontStyle.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.rcUploadTextColor,
                            fontSize: 15)),
                    const SizedBox(height: 10),
                    _rcUpload(),
                    const SizedBox(height: 20),
                    Text(AppStrings.addOns,
                        style: AppConstant.labelFontStyle.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.colorBlack,
                            fontSize: 19)),
                    addOnsListView(),
                    _totalPriceView(),
                    const SizedBox(height: 80),
                  ],
                )),
          ),
          _payNowButton()
        ],
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
      title: Text(AppStrings.summary, style: AppConstant.appBarFontStyleBold),
    );
  }

  myPackageView() {
    List<String> text = [
      "15  alternate days",
      "Daily Car Cleaning- Exterior",
      "Vaccum every Sunday",
    ];
    return Container(
        decoration: AppConstant.boxDecoration.copyWith(
            color: Colors.white,
            border: Border.all(color: Colors.transparent),
            boxShadow: [
              const BoxShadow(
                  color: AppColors.greenColorWithOpacity,
                  offset: Offset(0, 2),
                  blurRadius: 0)
            ]),
        // margin: const EdgeInsets.only(right: 24, left: 24, bottom: 20),
        padding: const EdgeInsets.only(left: 15, top: 12),
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
                    Text(AppStrings.currentPlan,
                        style: AppConstant.labelFontStyle.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.colorBlack,
                            fontSize: 10)),
                    Text("Silver Plan",
                        style: AppConstant.labelFontStyle.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.colorBlack,
                            fontSize: 18)),
                    const SizedBox(height: 4),
                    Text('Change Package',
                        style: AppConstant.labelFontStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryColor,
                            fontSize: 12,
                            decoration: TextDecoration.underline))
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
                          Text('₹ 100',
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
                    Text('₹ 500',
                        style: AppConstant.labelFontStyle.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.colorBlack,
                            fontSize: 15,
                            decoration: TextDecoration.lineThrough))
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    for (var i in text)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
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
                                    fontSize: 13)),
                          ],
                        ),
                      )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ));
  }

  Widget startFromTextField() {
    return Row(
      children: [
        Expanded(
          child: CommonTextField(
            labelText: AppStrings.startFrom,
            prefixIcon: AppImages.calenderIcon,
            onTap: () {},
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CommonTextField(
            labelText: AppStrings.noOfMonth,
            prefixIcon: AppImages.dropdownIcon,
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget selectTimeSlotTextField() {
    return CommonTextField(
      labelText: AppStrings.selectTimeSlot,
      prefixIcon: AppImages.dropdownIcon,
      onTap: () {},
    );
  }

  Widget enterVehicleNO() {
    return CommonTextField(
      labelText: AppStrings.enterVehicleNo,
      onTap: () {},
    );
  }

  Widget selectManufacturer() {
    return CommonTextField(
      labelText: AppStrings.selectManufacturer,
      prefixIcon: AppImages.dropdownIcon,
      onTap: () {},
    );
  }

  Widget selectModel() {
    return CommonTextField(
      labelText: AppStrings.selectModel,
      prefixIcon: AppImages.dropdownIcon,
      onTap: () {},
    );
  }

  Widget enterCouponCode() {
    return Stack(
      children: [
        CommonTextField(
          labelText: AppStrings.enterCouponCode,
          onTap: () {},
        ),
        Positioned(
          right: 15,
          top: 14,
          child: InkWell(
              onTap: () {},
              child: Text("Apply",
                  style: AppConstant.labelFontStyle.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.colorGreen,
                      fontSize: 14))),
        ),
      ],
    );
  }

  _rcUpload() {
    return InkWell(
      onTap: () => showRCUploadDialog(context),
      child: Container(
          decoration: AppConstant.boxDecoration.copyWith(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(
                color: AppColors.pinBorderColor,
              ),
              boxShadow: [
                const BoxShadow(
                    color: Color(0xFFFFFFFF),
                    offset: Offset(0, 2),
                    blurRadius: 3)
              ]),
          height: 100,
          width: 100,
          child: const Icon(
            Icons.add,
            size: 30,
            color: AppColors.colorGreen,
          )),
    );
  }

  addOnsListView() {
    return ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              selectedIndex = index;
              setState(() {});
            },
            child: Container(
                decoration: AppConstant.boxDecoration,
                height: 90,
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.only(left: 15),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    SvgPicture.asset(index == selectedIndex
                        ? AppImages.selectedRadioButton
                        : AppImages.unselectedRadioButton),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text("Tyre Polishing - Once a Week",
                          style: AppConstant.labelFontStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.colorBlack,
                              fontSize: 14)),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
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
                )),
          );
        });
  }

  subscriptionText() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: AppConstant.boxDecoration.copyWith(
          color: const Color(0xFFFFF4F3),
          border: Border.all(color: const Color(0xFFFFC5C2), width: 0.5),
          boxShadow: [
            const BoxShadow(
                color: Color(0xFFFFF4F3), offset: Offset(0, 2), blurRadius: 3)
          ]),
      child: Text(
          "Now you can avail a free subscription of 2 months simply by uploading your vehicle's RC.",
          style: AppConstant.labelFontStyle.copyWith(
              fontWeight: FontWeight.w500,
              color: const Color(0xFF5B5B5B),
              fontSize: 14)),
    );
  }

  _payNowButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CommonActionButtonWidget(
          text: AppStrings.payNow.toUpperCase(),
          isProgressShown: false,
          height: 60,
          onPressed: () {},
          radius: 0),
    );
  }

  _totalPriceView() {
    return Container(
      decoration: AppConstant.boxDecoration.copyWith(
          color: const Color(0xFFFFF1E3),
          border: Border.all(color: Colors.transparent),
          boxShadow: [
            const BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.11),
                offset: Offset(0, 2),
                blurRadius: 3)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.packagePrice,
                    textAlign: TextAlign.start,
                    style: AppConstant.labelFontStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.colorBlack,
                        fontSize: 14)),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('₹ 50',
                        style: AppConstant.labelFontStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.colorBlack,
                            fontSize: 15)),
                    Text('for 3 month(s)',
                        style: AppConstant.labelFontStyle.copyWith(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF3F3F3F),
                            fontSize: 10)),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 16),
                Text(AppStrings.addOns,
                    style: AppConstant.labelFontStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.colorBlack,
                        fontSize: 14)),
                const SizedBox(width: 8),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('• Dry Cleaning',
                          style: AppConstant.labelFontStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.colorBlack,
                              fontSize: 14)),
                      Text('₹ 200',
                          style: AppConstant.labelFontStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.colorBlack,
                              fontSize: 15)),
                    ])
              ],
            ),
          ),
          const Divider(),
          const SizedBox(height: 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 10),
              SvgPicture.asset(AppImages.discountIcon),
              const SizedBox(width: 10),
              Expanded(
                child: Text('Code CARBOYYW22 applied!',
                    style: AppConstant.labelFontStyle.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.colorBlack,
                        fontStyle: FontStyle.italic,
                        fontSize: 14)),
              ),
              const SizedBox(width: 10),
              Text('-₹50',
                  style: AppConstant.labelFontStyle.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.colorBlack,
                      fontStyle: FontStyle.italic,
                      fontSize: 15)),
              const SizedBox(width: 4),
              SvgPicture.asset(AppImages.deleteIcon),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 12),
              SvgPicture.asset(AppImages.subscription,
                  color: AppColors.colorGreen),
              const SizedBox(width: 10),
              Text('2 months of free subscription applied',
                  style: AppConstant.labelFontStyle.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.colorGreen,
                      fontStyle: FontStyle.italic,
                      fontSize: 14)),
              const SizedBox(width: 10),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(AppStrings.total,
                        style: AppConstant.labelFontStyle.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.colorBlack,
                            fontSize: 17)),
                    Text('₹450',
                        style: AppConstant.labelFontStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.colorBlack,
                            fontSize: 17)),
                  ],
                ),
                const SizedBox(width: 8),
                Text('Expire on 9 Sep 2022',
                    style: AppConstant.labelFontStyle.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.colorBlack,
                        fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showRCUploadDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "RC Upload",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (_, __, ___) {
        return Builder(
          builder: (context) {
            return Center(
              child: Wrap(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          Text(
                              'You are no longer eligible for  2 months of free subscription via  RC Upload offer.',
                              textAlign: TextAlign.center,
                              style: AppConstant.labelFontStyle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.colorBlack,
                                  fontSize: 16)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                            child: CommonActionButtonWidget(
                                text: "Continue",
                                height: 48,
                                radius: 4,
                                buttonColor: const Color(0xff2E9F00),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        );
      },
    );
  }
}
