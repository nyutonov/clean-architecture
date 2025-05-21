import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tana/core/extension/extension.dart';
import 'package:tana/core/utils/utils.dart';

import '../../../../constants/constants.dart';
import '../../../../core/widgets/bottom_sheet.dart';
import '../../../../core/widgets/button_with_scale.dart';

Future<void> selectCityBottomSheet({
  required String city,
  required Function(String) onCitySelected,
}) async {
  return triggerBottomSheet(
    title: "Выберите город",
    content: SelectCityBottomSheet(
      city: city,
      onCitySelected: onCitySelected,
    ),
  );
}

class SelectCityBottomSheet extends StatefulWidget {
  final String city;
  final Function(String) onCitySelected;

  const SelectCityBottomSheet({
    super.key,
    required this.city,
    required this.onCitySelected,
  });

  @override
  State<SelectCityBottomSheet> createState() => _SelectCityBottomSheetState();
}

class _SelectCityBottomSheetState extends State<SelectCityBottomSheet> with SingleTickerProviderStateMixin {
  Region? selectedRegion;
  String? selectedCity;

  late AnimationController animationController;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );

    selectedCity = widget.city;
    selectedRegion = regions.firstWhere(
      (region) => region.children.contains(widget.city),
      orElse: () => regions.first,
    );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: selectedRegion == null,
      onPopInvokedWithResult: (didPop, result) {
        animationController.reverse().then((_) {
          selectedRegion = null;

          setState(() {});
        });
      },
      child: Column(
        children: [
          PUtils.kGap12,
          TextField(
            decoration: InputDecoration(
              isDense: true,
              hintText: "Поиск",
              hintStyle: context.textStyle.textFieldHint.copyWith(
                color: context.colorScheme.primary,
              ),
              prefixIcon: Padding(
                padding: PUtils.kPaddingAll12,
                child: SvgPicture.asset(
                  PIcons.search,
                ),
              ),
              filled: true,
              fillColor: context.color.color9f9,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          PUtils.kGap12,
          Expanded(
            child: Stack(
              children: [
                Visibility(
                  visible: selectedRegion == null,
                  child: ListView.builder(
                    itemCount: regions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        tileColor: context.color.background,
                        title: Text(
                          regions[index].name,
                        ),
                        trailing: SvgPicture.asset(
                          PIcons.chevronRight,
                        ),
                        onTap: () {
                          selectedRegion = regions[index];

                          setState(() {});

                          animationController.forward();
                        },
                      );
                    },
                  ),
                ),
                if (selectedRegion != null)
                  SlideTransition(
                    position: slideAnimation,
                    child: ListView.builder(
                      itemCount: selectedRegion!.children.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          tileColor: context.color.background,
                          title: Text(
                            selectedRegion!.children[index],
                          ),
                          trailing: SvgPicture.asset(
                            (selectedCity == selectedRegion!.children[index]) ? PIcons.squareCheck : PIcons.square,
                          ),
                          onTap: () {
                            if (selectedCity == selectedRegion!.children[index]) {
                              selectedCity = null;

                              setState(() {});

                              return;
                            }

                            selectedCity = selectedRegion!.children[index];

                            setState(() {});
                          },
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
          if (selectedRegion != null)
            Padding(
              padding: PUtils.kPaddingSymVer12,
              child: Row(
                children: [
                  Expanded(
                    child: ButtonWithScale(
                      onPressed: (selectedCity != null && selectedRegion?.children.contains(selectedCity) == true)
                          ? () {
                              context.pop();

                              widget.onCitySelected(selectedCity!);
                            }
                          : null,
                      child: Text("Готово"),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class Region {
  final String name;
  final List<String> children;

  Region({required this.name, required this.children});
}

final List<Region> regions = [
  Region(name: 'Ташкентская область', children: ['Ташкент', 'Чирчик', 'Янгиюль']),
  Region(name: 'Андижанская область', children: ['Андижан', 'Асака', 'Ханабад']),
  Region(name: 'Бухарская область', children: ['Бухара', 'Каган', 'Гиждуван']),
  Region(name: 'Джизакская область', children: ['Джизак', 'Галляарал', 'Пахтакор']),
  Region(name: 'Кашкадарьинская область', children: ['Карши', 'Шахрисабз', 'Камаши']),
  Region(name: 'Навоийская область', children: ['Навои', 'Зарафшан', 'Кызылтепа']),
  Region(name: 'Наманганская область', children: ['Наманган', 'Чартак', 'Пап']),
  Region(name: 'Каракалпакстан', children: ['Нукус', 'Кунград', 'Муйнак']),
  Region(name: 'Самаркандская область', children: ['Самарканд', 'Каттакурган', 'Ургут']),
  Region(name: 'Сурхандарьинская область', children: ['Термез', 'Денау', 'Шерабад']),
  Region(name: 'Сырдарьинская область', children: ['Гулистан', 'Сайхунобод', 'Баяут']),
  Region(name: 'Ферганская область', children: ['Фергана', 'Коканд', 'Маргилан']),
  Region(name: 'Хорезмская область', children: ['Ургенч', 'Хива', 'Янгиарык']),
];
