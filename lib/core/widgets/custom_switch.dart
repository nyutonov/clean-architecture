import 'package:flutter/material.dart';
import 'package:tana/core/extension/extension.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final Function(bool)? onChanged;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: FittedBox(
        child: Switch(
          value: value,
          onChanged: onChanged,
          padding: EdgeInsets.zero,
          thumbIcon: WidgetStateProperty.all(Icon(Icons.circle)),
          activeColor: context.color.background,
          activeTrackColor: context.colorScheme.secondary,
          inactiveThumbColor: context.color.background,
          inactiveTrackColor: context.color.color888,
          trackOutlineWidth: WidgetStateProperty.all(0),
          trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
        ),
      ),
    );
  }
}
