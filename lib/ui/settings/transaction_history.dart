import 'package:carboy/ui/common_widget/CommonActionButton.dart';
import 'package:carboy/ui/utils/AppColors.dart';
import 'package:carboy/ui/utils/AppStrings.dart';
import 'package:carboy/ui/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/AppImages.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({Key? key}) : super(key: key);

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: transactionHistoryListView(),
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
      title: Text(AppStrings.transactionHistory,
          style: AppConstant.appBarFontStyleBold),
    );
  }

  transactionHistoryListView() {
    return ListView.builder(
        itemCount: 10,
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
              padding: const EdgeInsets.only(left: 0, top: 12, bottom: 12),
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Invoice No : 12122823938",
                        style: AppConstant.labelFontStyle.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.colorGrey,
                            fontSize: 14)),
                    const SizedBox(height: 4),
                    Text(index % 2 != 0 ? "Diamond Plan" : "Economic Wash",
                        style: AppConstant.labelFontStyle.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.colorBlack,
                            fontSize: 18)),
                    const SizedBox(height: 4),
                    Text("15 Jan 2022",
                        style: AppConstant.labelFontStyle.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.colorGrey,
                            fontSize: 14)),
                  ],
                ),
                trailing: Text(index % 2 != 0 ? "₹500" : '₹ 350',
                    style: AppConstant.labelFontStyle.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.colorGreen,
                        fontSize: 18)),
              ));
        });
  }
}
