import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tana/core/extension/extension.dart';
import 'package:tana/core/utils/utils.dart';

import '../../router/app_routes.dart';

Future<T?> triggerBottomSheet<T>({
  required Widget content,
  String? title,
  Color? color,
  double? height,
  EdgeInsets? padding,
  bool isScrollControlled = true,
  bool useSafeArea = true,
  bool isDynamicHeight = false,
}) {
  return showModalBottomSheet(
    context: rootNavigatorKey.currentContext!,
    isScrollControlled: isScrollControlled,
    useSafeArea: useSafeArea,
    builder: (context) => SafeArea(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.only(
          bottom: context.viewInsets.bottom,
        ),
        padding: padding ?? PUtils.kPaddingSymHor16,
        height: isDynamicHeight ? null : ((context.viewInsets.bottom > 0) ? 1.sh : 0.9.sh),
        width: 1.sw,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 8,
                bottom: 12,
              ),
              child: Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: context.color.black.withValues(alpha: 0.15),
                  borderRadius: PUtils.kBorderRadius4,
                ),
              ),
            ),
            if (title != null) ...[
              Text(
                title,
                style: context.textStyle.dialogTitle,
              ),
            ],
            PUtils.kGap12,
            if (isDynamicHeight)
              content
            else
              Expanded(
                child: content,
              ),
          ],
        ),
      ),
    ),
  );
}
