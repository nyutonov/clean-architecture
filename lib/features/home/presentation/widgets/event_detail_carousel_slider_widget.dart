import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tana/constants/constants.dart';
import 'package:tana/core/extension/extension.dart';
import 'package:tana/core/utils/utils.dart';
import 'package:tana/core/widgets/type2_widget.dart';

class EventDetailCarouselSliderWidget extends StatefulWidget {
  const EventDetailCarouselSliderWidget({super.key});

  @override
  State<EventDetailCarouselSliderWidget> createState() => _EventDetailCarouselSliderWidgetState();
}

class _EventDetailCarouselSliderWidgetState extends State<EventDetailCarouselSliderWidget> {
  final CarouselSliderController carouselSliderController = CarouselSliderController();
  int index = 0;

  final concerts = [
    PImages.concert1,
    PImages.concert2,
    PImages.concert3,
    PImages.concert1,
    PImages.concert2,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 480,
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: concerts.length,
            itemBuilder: (_, index, __) {
              return Stack(
                children: [
                  Image.asset(
                    concerts[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 480,
                  ),
                  Container(
                    height: 480,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          context.color.black.withValues(alpha: 0.5),
                          context.color.black.withValues(alpha: 0),
                          context.color.black.withValues(alpha: 0.5),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              );
            },
            carouselController: carouselSliderController,
            options: CarouselOptions(
              height: 480,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayAnimationDuration: Duration(seconds: 1),
              enlargeCenterPage: true,
              enlargeFactor: 0,
              onPageChanged: (index, reason) {
                this.index = index;

                setState(() {});
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
          Positioned(
            top: 16,
            right: 12,
            left: 12,
            child: Column(
              children: [
                Row(
                  spacing: 4,
                  children: List.generate(
                    concerts.length,
                    (index) {
                      return Expanded(
                        child: Container(
                          height: 4,
                          decoration: BoxDecoration(
                            color: this.index == index ? context.color.background : context.color.background.withValues(alpha: 0.24),
                            borderRadius: PUtils.kBorderRadius2,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                PUtils.kGap16,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            PIcons.building,
                          ),
                          PUtils.kGap6,
                          Text(
                            "Tashkent",
                            style: context.textStyle.appBarTitle.copyWith(
                              color: context.color.background,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          PUtils.kGap12,
                          SvgPicture.asset(
                            PIcons.location,
                          ),
                          PUtils.kGap6,
                          Text(
                            "12 км",
                            style: context.textStyle.appBarTitle.copyWith(
                              color: context.color.background,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: PUtils.kBorderRadius8,
                        color: context.color.color8b2.withValues(alpha: 0.24),
                      ),
                      padding: PUtils.kPaddingAll8,
                      child: SvgPicture.asset(
                        PIcons.favoriteFilled,
                        height: 24,
                        width: 24,
                        colorFilter: ColorFilter.mode(
                          context.color.background,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 16,
            bottom: 12,
            child: Type2Widget(
              color: context.color.color8b2.withValues(alpha: 0.24),
              child: Text(
                "0+",
                style: context.textStyle.appBarTitle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: context.color.background,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
