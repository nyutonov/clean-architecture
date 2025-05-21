import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tana/constants/constants.dart';
import 'package:tana/core/extension/extension.dart';
import 'package:tana/core/utils/utils.dart';

import '../bloc/home/home_bloc.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function() onCityPressed;
  final Function() onProfilePressed;

  const HomeAppBar({
    super.key,
    required this.onCityPressed,
    required this.onProfilePressed,
  });

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: widget.onCityPressed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  state.selectedCity,
                  style: context.textStyle.appBarTitle.copyWith(
                    fontSize: 20,
                  ),
                ),
                PUtils.kGap6,
                SvgPicture.asset(
                  PIcons.chevronDown,
                ),
              ],
            ),
          );
        },
      ),
      actions: [
        GestureDetector(
          onTap: widget.onProfilePressed,
          child: Container(
            color: Colors.transparent,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: PUtils.kBorderRadius24,
                    color: context.color.color8b2,
                  ),
                  padding: PUtils.kPaddingSymVer2Hor10,
                  child: Text(
                    "free",
                    style: context.textStyle.appBarTitle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                PUtils.kGap12,
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: context.colorScheme.secondary,
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: PUtils.kBorderRadius100,
                    child: Image.asset(
                      PImages.person,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                PUtils.kGap16,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
