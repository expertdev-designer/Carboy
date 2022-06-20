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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int current = 0;
  final CarouselController controller = CarouselController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  backgroundColor: Colors.white,
                  expandedHeight: MediaQuery.of(context).size.width * 0.50,
                  snap: true,
                  pinned: false,
                  floating: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: _topBanner(),
                  )),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(_tabBar()),
                pinned: true,
              ),
            ];
          },
          body: const TabViewHome(),
        ),
      ),
    );
  }

  _tabBar() {
    return TabBar(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black,
      controller: _tabController,
      labelStyle: AppConstant.tabSelectedFontStyle,
      unselectedLabelStyle: AppConstant.tabUnselectedFontStyle,
      overlayColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
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
      indicatorWeight: 2,
      indicatorColor: AppColors.primaryColor,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      // indicator: BoxDecoration(
      //   border: Border.all(color: Colors.red),
      //   borderRadius: BorderRadius.circular(10),
      //   color: Colors.pinkAccent,
      // ),
      isScrollable: false,
      physics: const BouncingScrollPhysics(),
      onTap: (int index) {
        debugPrint('Tab $index is tapped');
      },
      enableFeedback: true,
      // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
      // controller: _tabController,
      tabs: _tabs,
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
