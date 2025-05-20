import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tana/core/extension/extension.dart';

import '../../../../../constants/constants.dart';
import '../../../../../core/utils/utils.dart';

part "main_screen.dart";

mixin MainMixin on State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  onPageChanged(int index) {
    widget.navigationShell.goBranch(index);
  }
}
