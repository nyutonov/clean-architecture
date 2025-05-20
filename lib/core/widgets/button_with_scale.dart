import 'package:flutter/material.dart';
import 'package:tana/core/extension/extension.dart';

class ButtonWithScale extends StatefulWidget {
  final double height;
  final double radius;
  final double horizontalPadding;
  final Function()? onPressed;
  final Widget child;
  final Color? color;
  final Color? borderColor;
  final TextStyle? textStyle;
  final Alignment? alignment;

  const ButtonWithScale({
    super.key,
    this.height = 52,
    this.radius = 24,
    this.horizontalPadding = 16,
    this.onPressed,
    required this.child,
    this.color,
    this.borderColor,
    this.textStyle,
    this.alignment = Alignment.center,
  });

  @override
  State<ButtonWithScale> createState() => _ButtonWithScaleState();
}

class _ButtonWithScaleState extends State<ButtonWithScale> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
    reverseDuration: const Duration(milliseconds: 200),
    value: 1.0,
    upperBound: 1.0,
    lowerBound: 0.8,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.decelerate,
    reverseCurve: Curves.decelerate,
  );

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onPressed == null) {
          return;
        } else {
          widget.onPressed!();
        }

        _controller.reverse().then((_) {
          _controller.forward();
        });
      },
      onTapUp: (_) {
        if (widget.onPressed == null) return;

        _controller.forward();
      },
      onTapDown: (_) {
        if (widget.onPressed == null) return;

        _controller.reverse();
      },
      onTapCancel: () {
        if (widget.onPressed == null) return;

        _controller.forward();
      },
      child: ScaleTransition(
        scale: _animation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: widget.height,
          padding: EdgeInsets.symmetric(
            horizontal: widget.horizontalPadding,
            vertical: widget.height / 3.5,
          ),
          alignment: widget.alignment,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            color: widget.onPressed != null ? (widget.color ?? context.colorScheme.primary) : context.color.black.withValues(alpha: 0.1),
            border: Border.all(
              color: widget.borderColor ?? Colors.transparent,
            ),
          ),
          child: DefaultTextStyle(
            style: widget.textStyle ?? context.textStyle.elevatedButtonText,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
