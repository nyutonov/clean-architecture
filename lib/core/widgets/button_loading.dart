import 'package:flutter/material.dart';
import 'package:tana/core/extension/extension.dart';

class ButtonLoading extends StatelessWidget {
  final Color? color;

  const ButtonLoading({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: 24,
      child: CircularProgressIndicator(
        color: color ?? context.color.background,
        strokeCap: StrokeCap.round,
      ),
    );
  }
}
