import 'package:carboy/ui/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/AppColors.dart';

// ignore: must_be_immutable
class CommonTextField extends StatelessWidget {
  String? labelText;
  String? initialValue;
  FormFieldValidator<String>? onValidate;
  TextEditingController? controller;
  FocusNode? focusNode;
  bool? obscureText;
  bool? isEnabled;
  bool? isFocused;
  TextInputAction? textInputAction;
  TextInputType? keyboardType;
  bool? isReadOnly;
  String? prefixIcon;
  GestureTapCallback onTap;
  int? maxLength;

  CommonTextField({
    Key? key,
    this.labelText,
    this.initialValue,
    this.onValidate,
    this.controller,
    this.focusNode,
    this.obscureText,
    this.isEnabled,
    this.isFocused,
    this.textInputAction,
    this.keyboardType,
    this.isReadOnly,
    this.prefixIcon,
    required this.onTap,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder borderStyle = OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.pinBorderColor, width: 1),
      borderRadius: BorderRadius.circular(4),
    );
    return TextFormField(
        obscureText: obscureText ?? false,
        readOnly: isReadOnly == true ? true : false,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        focusNode: focusNode,
        // enabled: isEnabled ?? true,
        controller: controller,
        onTap: onTap,
        maxLines: 1,
        minLines: 1,
        cursorColor: AppColors.primaryColor,
        validator: onValidate,
        autovalidateMode: AutovalidateMode.disabled,
        maxLength: maxLength ?? 100,
        buildCounter: (BuildContext context,
                {int? currentLength, int? maxLength, bool? isFocused}) =>
            null,
        style: AppConstant.labelFontStyle,
        decoration: InputDecoration(
            hintText: labelText,
            hintStyle: AppConstant.labelFontStyle
                .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
            errorStyle: AppConstant.labelFontStyle
                .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
            suffixIconConstraints:
                const BoxConstraints(minHeight: 20, minWidth: 20),
            suffixIcon: SvgPicture.asset(prefixIcon ?? ""),
            enabledBorder: borderStyle,
            disabledBorder: borderStyle,
            focusedBorder: borderStyle,
            border: borderStyle,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 16)));
  }
}
