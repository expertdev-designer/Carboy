import 'package:carboy/ui/common_widget/common_textField.dart';
import 'package:carboy/ui/navigation/navigation_bar.dart';
import 'package:carboy/ui/utils/AppColors.dart';
import 'package:carboy/ui/utils/AppStrings.dart';
import 'package:carboy/ui/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

import '../common_widget/CommonActionButton.dart';
import '../utils/AppImages.dart';

enum OTPVerificationWidgetState {
  mobileNumber,
  verifyMobileNumber,
}

class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  OTPVerificationWidgetState state = OTPVerificationWidgetState.mobileNumber;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: IconButton(
              padding: const EdgeInsets.only(left: 8),
              icon: SvgPicture.asset(AppImages.backArrow),
              onPressed: () {
                if (state == OTPVerificationWidgetState.mobileNumber) {
                  Navigator.pop(context);
                } else {
                  state = OTPVerificationWidgetState.mobileNumber;
                  setState(() {});
                }
              }),
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 4),
          state == OTPVerificationWidgetState.mobileNumber
              ? enterMobileNumberView()
              : verifyOTPView(),
          _bottomBackground()
        ]),
      ),
    );
  }

  Widget enterMobileNumberView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.enterYourMobileNumber,
            style: AppConstant.fontStyleSemiBold.copyWith(fontSize: 19)),
        const SizedBox(height: 10),
        _fourDigitOtpText(),
        const SizedBox(height: 10),
        mobileNumberTextField(),
        const SizedBox(height: 15),
        doNotWorryText(),
        const SizedBox(height: 15),
        emailTextField(),
        const SizedBox(height: 10),
        selectSociety(),
        const SizedBox(height: 20),
        getOtpButton()
      ],
    );
  }

  RichText _fourDigitOtpText() {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: AppStrings.weWillSendYou,
              style: AppConstant.labelFontStyle),
          TextSpan(
              text: AppStrings.fourDigitOTP,
              style: AppConstant.labelFontStyle
                  .copyWith(fontWeight: FontWeight.w600)),
          TextSpan(
              text: AppStrings.onYourMobileNumberForVerification,
              style: AppConstant.labelFontStyle)
        ],
      ),
    );
  }

  Widget mobileNumberTextField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 1, color: AppColors.pinBorderColor)),
      child: Row(
        children: [
          const SizedBox(width: 15),
          Text("+91",
              style: AppConstant.labelFontStyle
                  .copyWith(fontWeight: FontWeight.w500)),
          const SizedBox(width: 15),
          Container(height: 50, width: 1, color: AppColors.pinBorderColor),
          Expanded(
            child: TextFormField(
              style: AppConstant.labelFontStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: AppStrings.enterMobileNumber,
                  hintStyle: AppConstant.labelFontStyle
                      .copyWith(fontWeight: FontWeight.w500),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16)),
            ),
          )
        ],
      ),
    );
  }

  doNotWorryText() {
    return Text(AppStrings.doNotWorry, style: AppConstant.labelFontStyle);
  }

  Widget emailTextField() {
    return CommonTextField(
      labelText: AppStrings.enterEmail,
      onTap: () {},
    );
  }

  Widget selectSociety() {
    String chooseSociety = "Select Society";

    List<String> dataList = [
      "Select Society",
      "Society 2",
      "Society 3",
      "Society 4",
      "Society 5"
    ];

    return FormField<String>(
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
                  borderSide: const BorderSide(width: 0.7))),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              style: AppConstant.labelFontStyle
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
              hint: Text(AppStrings.selectSociety,
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
              items: dataList.map<DropdownMenuItem<String>>((String valueItem) {
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
    );
  }

  Widget getOtpButton() {
    return CommonActionButtonWidget(
        text: AppStrings.getOTP,
        onPressed: () async {
          state = OTPVerificationWidgetState.verifyMobileNumber;
          setState(() {});
        },
        isProgressShown: false);
  }

  verifyOTPView() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(AppStrings.optVerification,
          style: AppConstant.fontStyleSemiBold.copyWith(fontSize: 19)),
      const SizedBox(height: 4),
      Text("${AppStrings.enterTheOTPSentTo} +91 9876543210",
          style: AppConstant.labelFontStyle.copyWith(fontSize: 14)),
      const SizedBox(height: 30),
      pinView(),
      const SizedBox(height: 120),
      continueButton(),
      const SizedBox(height: 20),
      _resendText(),
      const SizedBox(height: 20),
    ]);
  }

  continueButton() {
    return CommonActionButtonWidget(
        text: AppStrings.continueText.toUpperCase(),
        onPressed: () {
          // setState(() {
          //   state = OTPVerificationWidgetState.mobileNumber;
          // });
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => const CarBoyNavigationBar()));
        },
        isProgressShown: false);
  }

  _resendText() {
    return Center(
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
                text: AppStrings.didnotReceive,
                style: AppConstant.fontStyleRegular),
            TextSpan(
                text: AppStrings.resend.toUpperCase(),
                style: AppConstant.fontStyleRegular.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline)),
          ],
        ),
      ),
    );
  }

  pinView() {
    PinTheme defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      margin: const EdgeInsets.only(right: 6),
      textStyle: const TextStyle(
          fontSize: 18,
          color: AppColors.colorBlack,
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.pinBorderColor),
          borderRadius: BorderRadius.circular(4)),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(4));

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(color: Colors.white),
    );

    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      validator: (s) {
        // return s == '2222' ? null : 'Pin is incorrect';
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => debugPrint(pin),
    );
  }

  _bottomBackground() {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(child: SvgPicture.asset(AppImages.otpScreenBg)),
      ],
    ));
  }
}
