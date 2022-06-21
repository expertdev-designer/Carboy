import 'dart:ui';

import 'package:carboy/ui/common_widget/CommonActionButton.dart';
import 'package:carboy/ui/utils/AppColors.dart';
import 'package:carboy/ui/utils/AppStrings.dart';
import 'package:carboy/ui/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common_widget/common_textField.dart';
import '../utils/AppImages.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _userImage(),
            const SizedBox(height: 25),
            nameTextField(),
            const SizedBox(height: 25),
            selectSociety(),
            const SizedBox(height: 25),
            addressTextField(),
            const SizedBox(height: 25),
            emailTextField(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.10),
            _saveButton()
          ],
        ),
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
      title:
          Text(AppStrings.editProfile, style: AppConstant.appBarFontStyleBold),
    );
  }

  _userImage() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.profileBg), fit: BoxFit.fill)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: .5, sigmaY: .5),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.7)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: SvgPicture.asset(AppImages.userImage,
                        height: 80, width: 80),
                  ),
                  Positioned(
                      right: 0,
                      bottom: 0,
                      child: SvgPicture.asset(AppImages.profileEdit))
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppImages.phoneIcon),
                  Text("+91 9991818888",
                      style: AppConstant.labelFontStyle.copyWith(
                          color: AppColors.colorBlack,
                          fontSize: 16,
                          fontWeight: FontWeight.w600))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget nameTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CommonTextField(
        labelText: AppStrings.name,
        textInputAction: TextInputAction.next,
        onTap: () {},
      ),
    );
  }

  Widget addressTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CommonTextField(
        labelText: AppStrings.address,
        textInputAction: TextInputAction.next,
        onTap: () {},
      ),
    );
  }

  Widget emailTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CommonTextField(
        labelText: AppStrings.email,
        textInputAction: TextInputAction.done,
        onTap: () {},
      ),
    );
  }

  Widget selectSociety() {
    String chooseSociety = "Society";

    List<String> dataList = [
      "Society",
      "Society 2",
      "Society 3",
      "Society 4",
      "Society 5"
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                // labelText: "hi",
                // labelStyle: textStyle,
                // labelText: _dropdownValue == null
                //     ? 'Where are you from'
                //     : 'From',
                // errorText: _errorBank,
                // errorStyle: TextStyle(
                //     color: Colors.redAccent, fontSize: 16.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: const BorderSide(width: 0.5))),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                style: AppConstant.labelFontStyle
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                hint: Text(AppStrings.society,
                    style: AppConstant.labelFontStyle
                        .copyWith(fontWeight: FontWeight.w500)),
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                value: chooseSociety,
                isExpanded: true,
                isDense: true,
                onChanged: (String? newValue) {
                  setState(() {
                    chooseSociety = newValue!;
                  });
                },
                items:
                dataList.map<DropdownMenuItem<String>>((String valueItem) {
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
    );
  }

  _saveButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CommonActionButtonWidget(
          text: AppStrings.save.toUpperCase(), onPressed: () {}),
    );
  }
}
