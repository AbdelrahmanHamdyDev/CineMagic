import 'package:cinemagic/Screens/info.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cinemagic/Models/Motion.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class carouselsSlider extends StatefulWidget {
  const carouselsSlider({super.key, required this.items});

  final List<Motion> items;

  @override
  State<carouselsSlider> createState() => _ImagesliderState();
}

class _ImagesliderState extends State<carouselsSlider> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final newitems = widget.items.take(5).toList();
    return Column(
      children: [
        Container(
          height: 350.h,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Theme.of(context).colorScheme.inverseSurface,
                Theme.of(context).colorScheme.inverseSurface.withOpacity(0.5),
                Colors.transparent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: newitems[_currentIndex].id,
                  child: Image.network(
                    newitems[_currentIndex].background,
                    fit: BoxFit.cover,
                    height: 280.h,
                    width: double.infinity,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CarouselSlider.builder(
                  itemCount: newitems.length,
                  itemBuilder: (ctx, index, indx2) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => motionInfo(
                              item: newitems[index],
                            ),
                          ),
                        );
                      },
                      child: Image.network(
                        newitems[index].image,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    viewportFraction: 0.3,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    enlargeCenterPage: true,
                    enlargeFactor: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        AnimatedSmoothIndicator(
          activeIndex: _currentIndex,
          count: newitems.length,
          effect: WormEffect(),
        ),
      ],
    );
  }
}
