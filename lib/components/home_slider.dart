import 'package:cakappramuka/pages/learn/pramuka_pandega.dart';
import 'package:cakappramuka/pages/learn/pramuka_penegak.dart';
import 'package:cakappramuka/pages/learn/pramuka_penggalang.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:cakappramuka/pages/learn/pramuka_siaga.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final List<Map<String, dynamic>> sliderItem = [
    {
      "title": "Siaga",
      "image": "assets/images/home-sliders/pramuka-siaga.jpg",
      "navigateTo": PramukaSiagaPage()
    },
    {
      "title": "Penggalang",
      "image": "assets/images/home-sliders/pramuka-penggalang.jpg",
      "navigateTo": PramukaPenggalangPage()
    },
    {
      "title": "Penegak",
      "image": "assets/images/home-sliders/pramuka-penegak.jpg",
      "navigateTo": PramukaPenegakPage()
    },
    {
      "title": "Pandega",
      "image": "assets/images/home-sliders/pramuka-pandega.jpg",
      "navigateTo": PramukaPandegaPage()
    },
  ];
  int currentState = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 150.0,
            enableInfiniteScroll: true,
            reverse: false,
            onPageChanged: (index, reason) {
              setState(() {
                currentState = index;
              });
            },
            aspectRatio: 16 / 9,
            autoPlayInterval: Duration(seconds: 10),
            autoPlayAnimationDuration: Duration(milliseconds: 500),
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlay: true,
          ),
          items: sliderItem.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: i['navigateTo'],
                            type: PageTransitionType.bottomToTop));
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 4, right: 4),
                    child: Center(
                        child: Stack(
                      children: <Widget>[
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(12)),
                          alignment: Alignment.center,
                          child: Image.asset(
                            i['image']!,
                            height: 250,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Materi',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.75),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                                Text(
                                  "Pramuka ${i['title']}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.0),
                                ),
                              ],
                            )),
                      ],
                    )),
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 12),
        AnimatedSmoothIndicator(
          activeIndex: currentState,
          count: sliderItem.length,
          effect: ExpandingDotsEffect(
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: Theme.of(context).primaryColor,
            dotColor: Theme.of(context).primaryColor.withOpacity(0.325),
          ),
        ),
      ],
    );
  }
}
