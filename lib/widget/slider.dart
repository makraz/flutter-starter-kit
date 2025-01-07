import 'dart:async';
import 'package:flutter/material.dart';

class CarouselSlider extends StatefulWidget {
  final List<Widget> items;
  final double height;
  final double viewportFraction;
  final EdgeInsets padding;
  final Color activeIndicatorColor;
  final Color inactiveIndicatorColor;
  final double indicatorHeight;
  final double indicatorWidth;
  final Duration indicatorDuration;
  final bool autoSlide;
  final Duration autoSlideInterval;

  const CarouselSlider({
    Key? key,
    required this.items,
    required this.height,
    required this.viewportFraction,
    required this.padding,
    required this.activeIndicatorColor,
    required this.inactiveIndicatorColor,
    required this.indicatorHeight,
    required this.indicatorWidth,
    required this.indicatorDuration,
    this.autoSlide = false,
    this.autoSlideInterval = const Duration(seconds: 3),
  }) : super(key: key);

  @override
  _CarouselSliderState createState() =>
      _CarouselSliderState();
}

class _CarouselSliderState
    extends State<CarouselSlider> {
  int _currentIndex = 0;
  late Timer _timer;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: widget.viewportFraction);

    if (widget.autoSlide) {
      _startAutoSlide();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    if (widget.autoSlide) {
      _timer.cancel();
    }
    super.dispose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(widget.autoSlideInterval, (timer) {
      if (_currentIndex < widget.items.length - 1) {
        setState(() {
          _currentIndex++;
        });
      } else {
        setState(() {
          _currentIndex = 0;
        });
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: widget.height,
          padding: widget.padding,
          child: PageView.builder(
            itemCount: widget.items.length,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return widget.items[index];
            },
          ),
        ),
        // Display indicators for the carousel
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.items.length,
            (index) => AnimatedContainer(
              duration: widget.indicatorDuration,
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              width: _currentIndex == index ? widget.indicatorWidth : 12.0,
              height: widget.indicatorHeight,
              decoration: BoxDecoration(
                color: _currentIndex == index
                    ? widget.activeIndicatorColor
                    : widget.inactiveIndicatorColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
