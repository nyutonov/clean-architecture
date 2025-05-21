import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tana/constants/constants.dart';
import 'package:tana/core/widgets/button_with_scale.dart';
import 'package:tana/core/widgets/center_warning_widget.dart';
import 'package:tana/core/widgets/events_widget.dart';
import 'package:tana/core/widgets/social_media_widget.dart';
import 'package:tana/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:tana/features/home/presentation/bottom_sheets/select_city_bottom_sheet.dart';
import 'package:tana/features/home/presentation/widgets/home_carousel_slider_widget.dart';
import 'package:tana/features/home/presentation/widgets/home_app_bar.dart';
import 'package:tana/router/app_routes.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/event_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeBloc bloc;

  final events = [
    PImages.event1,
    PImages.event2,
    PImages.event3,
  ];

  @override
  void initState() {
    super.initState();

    bloc = context.read<HomeBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        onProfilePressed: () {
          context.push(Routes.profile);
        },
        onCityPressed: () {
          selectCityBottomSheet(
            city: bloc.state.selectedCity,
            onCitySelected: (city) => bloc.add(OnChangeCityEvent(city)),
          );
        },
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.selectedCity != "Ташкент") {
            return CenterWarningWidget(
              image: "✨",
              title: "Нет событий в выбранном городе",
              description: "Но в других городах уже что-то происходит — посмотрите, что рядом!",
            );
          }

          return ListView(
            children: [
              HomeCarouselSliderWidget(),
              PUtils.kGap8,
              EventsWidget(
                title: "Моя подборка",
                isMySelections: true,
              ),
              EventsWidget(
                title: "В ближайшие дни",
              ),
              EventsWidget(
                title: "Бесплатные",
              ),
              SocialMediaWidget(),
              PUtils.kGap16,
              Column(
                spacing: 24,
                children: List.generate(
                  events.length,
                  (index) {
                    return EventWidget(
                      onPressed: () {
                        context.push(
                          Routes.eventDetail,
                          extra: {
                            "title": "Another Event",
                          },
                        );
                      },
                      image: events[index],
                    );
                  },
                ),
              ),
              PUtils.kGap24,
            ],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.selectedCity != "Ташкент") {
            return SafeArea(
              minimum: PUtils.kPaddingAll16,
              child: ButtonWithScale(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      PIcons.noteOutlined,
                    ),
                    PUtils.kGap8,
                    Text(
                      "Искать события",
                    ),
                  ],
                ),
              ),
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}
