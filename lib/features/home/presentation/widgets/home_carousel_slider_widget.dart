import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tana/constants/constants.dart';
import 'package:tana/core/extension/extension.dart';
import 'package:tana/core/utils/utils.dart';
import 'package:tana/core/widgets/button_with_scale.dart';
import 'package:tana/router/app_routes.dart';

class HomeCarouselSliderWidget extends StatefulWidget {
  const HomeCarouselSliderWidget({super.key});

  @override
  State<HomeCarouselSliderWidget> createState() => _HomeCarouselSliderWidgetState();
}

class _HomeCarouselSliderWidgetState extends State<HomeCarouselSliderWidget> {
  final CarouselSliderController carouselSliderController = CarouselSliderController();
  int index = 0;

  final concerts = [
    PImages.concert1,
    PImages.concert2,
    PImages.concert3,
    PImages.concert1,
    PImages.concert2,
    PImages.concert3,
    PImages.concert1,
    PImages.concert2,
    PImages.concert3,
    PImages.concert1,
    PImages.concert2,
    PImages.concert3,
    PImages.concert1,
    PImages.concert2,
    PImages.concert3,
    PImages.concert1,
    PImages.concert2,
    PImages.concert3,
    PImages.concert1,
    PImages.concert2,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 460,
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
                    height: 460,
                  ),
                  Container(
                    height: 460,
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
                  Positioned(
                    bottom: 24,
                    left: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Рок-концерт под звездами",
                          style: context.textStyle.appBarTitle.copyWith(
                            color: context.color.background,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        PUtils.kGap8,
                        Text(
                          "22 марта 2025, 19:00",
                          style: context.textStyle.appBarTitle.copyWith(
                            color: context.color.background,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        PUtils.kGap16,
                        ButtonWithScale(
                          height: 48,
                          onPressed: () {
                            context.push(
                              Routes.eventDetail,
                              extra: {
                                "title": "Рок-концерт под звездами",
                              },
                            );
                          },
                          alignment: null,
                          horizontalPadding: 32,
                          textStyle: context.textStyle.elevatedButtonText.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                          child: Text("Подробнее"),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            carouselController: carouselSliderController,
            options: CarouselOptions(
              height: 460,
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
            child: Row(
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
          ),
        ],
      ),
    );
  }
}
