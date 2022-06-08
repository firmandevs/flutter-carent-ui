import 'dart:math';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../const.dart';
import '../../styles/colors.dart';
import '../../styles/label.dart';
import '../car/car_image_card.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  final _currentPageNotifier = ValueNotifier<int>(0);
  final _pageController = PageController(viewportFraction: 0.85);
  final _pageControllerText = PageController(viewportFraction: 0.5);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double percentage = new Random().nextDouble();
    String percentageLabel = "${(percentage * 10).toInt()}/10";
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor.withOpacity(0),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(
            "assets/images/menu.png",
            color: white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              EvaIcons.searchOutline,
              size: 25,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              "assets/images/logo-app.png",
              width: 70,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            child: PageView.builder(
                padEnds: true,
                pageSnapping: true,
                allowImplicitScrolling: true,
                controller: _pageControllerText,
                onPageChanged: (int index) => setState(() {
                      _index = index;
                      _currentPageNotifier.value = index;
                      _pageController.animateToPage(index,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                    }),
                scrollDirection: Axis.horizontal,
                itemCount: carList.length,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Transform.scale(
                          alignment: Alignment.center,
                          scale: _index == index ? 1 : 0.7,
                          child: Column(
                            children: [
                              Text(
                                carList[index].title,
                                style: _index == index
                                    ? labelH2White
                                    : labelH2Grey.copyWith(letterSpacing: 2),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Container(
            height: 230,
            child: PageView.builder(
                padEnds: true,
                pageSnapping: true,
                allowImplicitScrolling: true,
                controller: _pageController,
                onPageChanged: (int index) => setState(() {
                      _index = index;
                      _currentPageNotifier.value = index;
                      _pageControllerText.animateToPage(index,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                    }),
                scrollDirection: Axis.horizontal,
                itemCount: carList.length,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      //Do something here
                    },
                    child: Column(
                      children: [
                        Transform.scale(
                          alignment: Alignment.center,
                          scale: _index == index ? 1 : 0.6,
                          child: Column(
                            children: [
                              Image.asset(
                                carList[index].preview,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          _buildCircleIndicator(),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Discover",
                  style: labelH4White.copyWith(letterSpacing: 2),
                ),
                LinearPercentIndicator(
                  backgroundColor: grey.withOpacity(0.3),
                  width: 100,
                  animation: true,
                  lineHeight: 5.0,
                  animationDuration: 2500,
                  trailing: Text(
                    percentageLabel,
                    style: labelGrey,
                  ),
                  percent: percentage,
                  barRadius: Radius.circular(20),
                  progressColor: accentColor,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 210,
            color: primaryColor,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: carList[_index].imageList.length,
                itemBuilder: (_, index) {
                  return CarImageCard(
                      carImage: carList[_index].imageList[index]);
                }),
          )
        ],
      )),
    );
  }

  _buildCircleIndicator() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          selectedDotColor: accentColor,
          dotColor: grey.withOpacity(0.3),
          size: 7,
          selectedSize: 7,
          itemCount: carList.length,
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }
}
