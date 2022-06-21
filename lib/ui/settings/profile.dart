import 'dart:io';
import 'dart:ui';

import 'package:carboy/ui/common_widget/CommonActionButton.dart';
import 'package:carboy/ui/settings/edit_profile.dart';
import 'package:carboy/ui/utils/AppColors.dart';
import 'package:carboy/ui/utils/AppStrings.dart';
import 'package:carboy/ui/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../common_widget/common_textField.dart';
import '../utils/AppImages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker _picker = ImagePicker();
  late XFile? pickedFile;
  CroppedFile? croppedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _userImage(),
            const SizedBox(height: 25),
            profileUserInfo(label: AppStrings.name, value: "Albert Smith"),
            profileUserInfo(
                label: AppStrings.society, value: "Park Venue Society"),
            profileUserInfo(
                label: AppStrings.address, value: "49-1A, tribute area, delhi"),
            profileUserInfo(
                label: AppStrings.email, value: "albertsmith@gmail.com"),
            profileUserInfo(label: AppStrings.vehicleNo, value: "DL1CB 1844"),
            _rcUpload()
          ],
        ),
      ),
    );
  }

  appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFFD8D8D8),
      leading: IconButton(
          padding: const EdgeInsets.only(left: 8),
          icon: SvgPicture.asset(AppImages.backArrow),
          onPressed: () {
            Navigator.pop(context);
          }),
      centerTitle: true,
      title: Text(AppStrings.profile, style: AppConstant.appBarFontStyleBold),
      actions: [
        IconButton(
            padding: const EdgeInsets.only(right: 8),
            icon: SvgPicture.asset(AppImages.edit),
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const EditProfilePage()));
            }),
      ],
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
          decoration: const BoxDecoration(color: Color(0xFFD8D8D8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12, right: 6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: croppedFile != null
                          ? Image.file(File(croppedFile!.path),
                              height: 80, width: 80)
                          : SvgPicture.asset(AppImages.userImage,
                              height: 80, width: 80),
                    ),
                  ),
                  Positioned(
                      right: 0,
                      bottom: 0,
                      child: IconButton(
                          icon: SvgPicture.asset(AppImages.profileEdit),
                          onPressed: showImagePickerBottomSheet))
                ],
              ),
              const SizedBox(height: 10),
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

  Widget profileUserInfo({label, value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: Text(label,
                style: AppConstant.labelFontStyle.copyWith(
                    color: AppColors.profileLabelColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: Text(value,
                style: AppConstant.labelFontStyle.copyWith(
                    color: AppColors.colorBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
          ),
          label != AppStrings.vehicleNo ? const Divider() : const SizedBox(),
        ],
      ),
    );
  }

  _rcUpload() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          height: 110,
          child: ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return index == 2
                  ? uploadView()
                  : Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0, top: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: SvgPicture.asset(
                                "assets/images/driver_lic.svg",
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100),
                          ),
                        ),
                        const Positioned(
                            right: 0,
                            child: Icon(Icons.highlight_remove_outlined))
                      ],
                    );
            },
          ),
        ),
      ],
    );
  }

  uploadView() {
    return Container(
        margin: EdgeInsets.only(top: 10),
        decoration: AppConstant.boxDecoration.copyWith(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              color: AppColors.pinBorderColor,
            ),
            boxShadow: [
              const BoxShadow(
                  color: Color(0xFFFFFFFF), offset: Offset(0, 2), blurRadius: 3)
            ]),
        height: 110,
        width: 100,
        child: const Icon(Icons.add, size: 40, color: AppColors.colorGreen));
  }

  showImagePickerBottomSheet() {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        builder: (BuildContext bc) {
          return Container(
            padding: const EdgeInsets.all(25),
            child: Wrap(
              children: [
                ListTile(
                    leading: const Icon(
                      Icons.camera_alt,
                      color: AppColors.primaryColor,
                    ),
                    title: Text("Pick image from Camera",
                        style: AppConstant.buttonFontStyle
                            .copyWith(color: AppColors.colorBlack)),
                    onTap: () {
                      getImage(resource: ImageSource.camera);
                      Navigator.pop(context);
                    }),
                const Divider(),
                ListTile(
                  leading:
                      const Icon(Icons.image, color: AppColors.primaryColor),
                  title: Text("Pick image from Gallery",
                      style: AppConstant.buttonFontStyle
                          .copyWith(color: AppColors.colorBlack)),
                  onTap: () {
                    getImage(resource: ImageSource.gallery);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  getImage({required ImageSource resource}) async {
    try {
      pickedFile = await _picker.pickImage(
        source: resource,
      );
      setState(() {
        // _imageFile = pickedFile;
        cropRectangleImage(pickedFile);
      });
    } catch (e) {
      setState(() {
        print("Picker Error ${e.toString()}");
      });
    }
  }

  Future cropRectangleImage(
    imageFile,
  ) async {
    ImageCropper imageCropper = ImageCropper();
    croppedFile = await imageCropper.cropImage(
      sourcePath: imageFile.path,
      cropStyle: CropStyle.circle,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
      ],
    );

    if (croppedFile != null) {
      debugPrint("croppedFile  $croppedFile");
      setState(() {});
      imageFile = croppedFile;
    }

    return imageFile;
  }
}
