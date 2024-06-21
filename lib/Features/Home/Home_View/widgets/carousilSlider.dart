import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:spareproject/Extention/extension.dart';

class CarousilSliderr extends StatefulWidget {
  const CarousilSliderr({super.key});

  @override
  State<CarousilSliderr> createState() => _CarousilSliderState();
}

class _CarousilSliderState extends State<CarousilSliderr> {
  int selectedindex = 0;

  List<Widget> carousilImagelist = [
    ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Image.asset(
        'carousil1.png'.ImagePath,
        fit: BoxFit.cover,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Image.asset(
        'carosel1.png'.ImagePath,
        fit: BoxFit.cover,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Container(
            height: 147,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
            child: CarouselSlider(
              items: carousilImagelist,
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    selectedindex = index;
                  });
                },
                aspectRatio: 233,
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayCurve: Curves.easeInQuad,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 1,
              ),
            ),
          ),
        ),
        DotsIndicator(
          dotsCount: carousilImagelist.length,
          position: selectedindex,
          axis: axisDirectionToAxis(AxisDirection.right),
          decorator: DotsDecorator(
            activeColor: Colors.black,
          ),
        ),
      ],
    );
  }
}
