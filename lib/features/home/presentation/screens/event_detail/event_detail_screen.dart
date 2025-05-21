import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tana/constants/constants.dart';
import 'package:tana/core/extension/extension.dart';
import 'package:tana/core/utils/utils.dart';
import 'package:tana/core/widgets/button_with_scale.dart';
import 'package:tana/core/widgets/comments_widget.dart';
import 'package:tana/core/widgets/events_widget.dart';
import 'package:tana/core/widgets/type2_widget.dart';
import 'package:tana/core/widgets/users_widget.dart';

import '../../../../../core/widgets/type_widget.dart';
import '../../widgets/event_detail_carousel_slider_widget.dart';

class EventDetailScreen extends StatefulWidget {
  final String title;

  const EventDetailScreen({
    super.key,
    required this.title,
  });

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: context.textStyle.appBarTitle,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                PIcons.upload,
              ),
            ),
            PUtils.kGap4,
          ],
        ),
        body: ListView(
          children: [
            EventDetailCarouselSliderWidget(),
            Padding(
              padding: PUtils.kPaddingSymHor16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PUtils.kGap16,
                  Row(
                    children: [
                      Type2Widget(
                        color: context.color.color8b2,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              PIcons.eyeOn,
                              height: 16,
                              colorFilter: ColorFilter.mode(
                                context.color.black,
                                BlendMode.srcIn,
                              ),
                            ),
                            PUtils.kGap4,
                            Text(
                              "3456",
                              style: context.textStyle.appBarTitle.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PUtils.kGap8,
                      Type2Widget(
                        color: context.color.color8b2,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              PIcons.favoriteOutlined,
                              height: 16,
                              colorFilter: ColorFilter.mode(
                                context.color.black,
                                BlendMode.srcIn,
                              ),
                            ),
                            PUtils.kGap4,
                            Text(
                              "23",
                              style: context.textStyle.appBarTitle.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  PUtils.kGap16,
                  Text(
                    widget.title,
                    style: context.textStyle.appBarTitle.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  PUtils.kGap4,
                  Text(
                    "24 апреля в 20:00",
                    style: context.textStyle.appBarTitle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  PUtils.kGap8,
                  Text(
                    "от 150 000 сум",
                    style: context.textStyle.appBarTitle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: context.color.color888,
                    ),
                  ),
                  PUtils.kGap16,
                  ListTile(
                    onTap: () {},
                    leading: SvgPicture.asset(
                      PIcons.map,
                    ),
                    trailing: SvgPicture.asset(
                      PIcons.chevronRight,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Муйнак, Каракалпакстан",
                          style: context.textStyle.appBarTitle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        PUtils.kGap4,
                      ],
                    ),
                    subtitle: Text(
                      "Кладбище кораблей",
                      style: context.textStyle.appBarTitle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: context.color.color888,
                      ),
                    ),
                  ),
                  PUtils.kGap16,
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      TypeWidget(
                        fontSize: 15,
                        title: "🔮 Квесты и загадки",
                      ),
                      TypeWidget(
                        fontSize: 15,
                        title: "🧘 Йога",
                      ),
                      TypeWidget(
                        fontSize: 15,
                        title: "🏝️ Отдых на море",
                      ),
                      TypeWidget(
                        fontSize: 15,
                        title: "💻 Программирование",
                      ),
                    ],
                  ),
                  PUtils.kGap16,
                  AnimatedSize(
                    alignment: Alignment.topCenter,
                    duration: const Duration(milliseconds: 200),
                    child: Builder(
                      builder: (context) {
                        final text = Text(
                          "Погрузитесь в атмосферу живого рока! Лучшие группы Ташкента зажгут сцену мощным звуком и драйвом. Вас ждут хиты, живой звук и невероятная энергетика. Не пропустите главный концерт весны. Погрузитесь в атмосферу живого рока! Лучшие группы Ташкента зажгут сцену мощным звуком и драйвом. Вас ждут хиты, живой звук и невероятная энергетика. Не пропустите главный концерт весны!",
                          style: context.textStyle.appBarTitle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: isExpanded ? 100 : 5,
                          overflow: TextOverflow.fade,
                        );

                        if (isExpanded) {
                          return text;
                        }

                        return ShaderMask(
                          shaderCallback: (bounds) {
                            return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                context.color.background,
                                context.color.background.withValues(alpha: 0.0),
                              ],
                              stops: [0.5, 1.0],
                            ).createShader(
                              Rect.fromLTRB(
                                bounds.left,
                                bounds.top,
                                bounds.right,
                                bounds.bottom,
                              ),
                            );
                          },
                          child: text,
                        );
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      isExpanded = !isExpanded;

                      setState(() {});
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 8,
                          bottom: 16,
                        ),
                        child: Text(
                          isExpanded ? "Свернуть" : "Читать далее",
                          style: context.textStyle.appBarTitle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: context.color.color888,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            UsersWidget(
              title: "Тоже хотят пойти",
            ),
            CommentsWidget(
              title: "Комментарии",
            ),
            EventsWidget(
              title: "Похожие события",
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(
          minimum: PUtils.kPaddingSymVer8Hor16,
          child: ButtonWithScale(
            onPressed: () {},
            child: Text(
              "Подробнее",
            ),
          ),
        ),
      ),
    );
  }
}
