import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tana/core/extension/extension.dart';
import 'package:tana/core/utils/utils.dart';

import '../../router/app_routes.dart';

enum SneakBarStatus {
  success,
  error,
  warning,
}

extension SneakBarStatusExtension on SneakBarStatus {
  Color get backgroundColor {
    switch (this) {
      case SneakBarStatus.success:
        return Color(0xFF32BA76);
      case SneakBarStatus.error:
        return Colors.red;
      case SneakBarStatus.warning:
        return Colors.orange;
    }
  }

  Widget get icon {
    switch (this) {
      case SneakBarStatus.success:
        return const Icon(
          Icons.check_circle,
        );
      case SneakBarStatus.error:
        return const Icon(
          Icons.error,
        );
      case SneakBarStatus.warning:
        return const Icon(
          Icons.warning,
        );
    }
  }
}

class CustomSneakBar {
  static void show({
    BuildContext? context,
    required SneakBarStatus status,
    String? message,
  }) {
    showFlash(
      context: context ?? rootNavigatorKey.currentContext!,
      duration: const Duration(seconds: 2),
      reverseTransitionDuration: const Duration(milliseconds: 700),
      transitionDuration: const Duration(milliseconds: 700),
      barrierColor: Colors.transparent,
      builder: (context, controller) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.black,
          ),
          child: Flash(
            controller: controller,
            position: FlashPosition.bottom,
            child: FlashBar(
              controller: controller,
              position: FlashPosition.bottom,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              padding: EdgeInsets.zero,
              margin: EdgeInsets.only(
                bottom: 16,
                left: 16,
                right: 16,
                top: 16,
              ),
              content: Container(
                padding: PUtils.kPaddingAll12,
                decoration: BoxDecoration(
                  color: status.backgroundColor,
                  borderRadius: PUtils.kBorderRadius16,
                ),
                child: Row(
                  children: [
                    IconTheme(
                      data: IconThemeData(
                        color: context.color.background,
                        size: 24,
                      ),
                      child: status.icon,
                    ),
                    PUtils.kGap8,
                    Expanded(
                      child: Text(
                        message ?? "Something went wrong",
                        style: context.textStyle.appBarTitle.copyWith(
                          fontWeight: FontWeight.w600,
                          color: context.color.background,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
