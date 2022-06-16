import 'package:carboy/ui/home/tabview_home.dart';
import 'package:carboy/ui/utils/AppColors.dart';
import 'package:carboy/ui/utils/AppImages.dart';
import 'package:carboy/ui/utils/Constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int current = 0;
  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _topBanner(),
          const Expanded(child: TabViewHome()),
        ],
      ),
    );
  }

  _topBanner() {
    List<String> imgList = [
      AppImages.homeBannerImage,
      AppImages.homeBannerImage,
      AppImages.homeBannerImage
    ];
    return CarouselSlider(
      carouselController: controller,
      options: CarouselOptions(
          height: MediaQuery.of(context).size.width * 0.48,
          aspectRatio: 16 / 9,
          viewportFraction: 1.0,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 1500),
          autoPlayCurve: Curves.easeInOut,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            setState(() {
              current = index;
            });
          },
          scrollDirection: Axis.horizontal),
      items: imgList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Stack(children: [
                  SvgPicture.asset(AppImages.homeBannerImage,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width),
                  Center(
                    child: Text('Make car look as\ngood as new',
                        textAlign: TextAlign.center,
                        style: AppConstant.labelFontStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.colorWhite,
                            fontSize: 28)),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                            onTap: () => controller.animateToPage(entry.key),
                            child: Container(
                              width: current == entry.key ? 8 : 6.0,
                              height: current == entry.key ? 8 : 6.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: current == entry.key
                                    ? AppColors.primaryColor
                                    : AppColors.colorWhite,
                              ),
                            ));
                      }).toList(),
                    ),
                  ),
                ]));
          },
        );
      }).toList(),
    );
  }
}
