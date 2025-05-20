import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:tana/core/extension/extension.dart";

import "../utils/utils.dart";

typedef Validator = String? Function(String?);
typedef OnChanged = void Function(String);
typedef OnFieldSubmitted = void Function(String);

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.controller,
    this.onChanged,
    this.focusNode,
    this.hintText,
    super.key,
    this.validator,
    this.textInputType,
    this.textCapitalization = TextCapitalization.none,
    this.cursorColor,
    this.enabled = true,
    this.obscure = false,
    this.inputFormatters,
    this.textInputAction = TextInputAction.next,
    this.nextFocusNode,
    this.errorText,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.prefixIcon,
    this.prefixTextStyle,
    this.suffixTextStyle,
    this.prefixText,
    this.suffixText,
    this.labelTextStyle,
    this.labelText,
    this.labelInTextField = false,
    this.contentPadding,
    this.cursorHeight,
    this.onFieldSubmitted,
    this.onTap,
    this.readOnly = false,
    this.fillColor,
    this.filled,
    this.autovalidateMode,
    this.maxLines,
    this.hintStyle,
    this.border,
  });

  final TextEditingController? controller;
  final Validator? validator;
  final OnChanged? onChanged;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextCapitalization textCapitalization;
  final Color? cursorColor;
  final bool enabled;
  final bool obscure;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction textInputAction;
  final String? hintText;
  final String? errorText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final TextStyle? prefixTextStyle;
  final TextStyle? suffixTextStyle;
  final TextStyle? labelTextStyle;
  final String? labelText;
  final String? prefixText;
  final String? suffixText;
  final bool labelInTextField;
  final EdgeInsetsGeometry? contentPadding;
  final double? cursorHeight;
  final OnFieldSubmitted? onFieldSubmitted;
  final VoidCallback? onTap;
  final Color? fillColor;
  final bool? filled;
  final AutovalidateMode? autovalidateMode;
  final int? maxLines;
  final InputBorder? border;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (labelText != null && !labelInTextField)
            Text(
              labelText ?? "",
              style: labelTextStyle ?? context.textStyle.textFieldLabel,
            ),
          if (labelText != null && !labelInTextField) PUtils.kGap8,
          TextFormField(
            key: key,
            onTap: onTap,
            style: context.textTheme.titleMedium,
            readOnly: readOnly,
            controller: controller,
            validator: validator,
            onChanged: onChanged,
            keyboardType: textInputType,
            focusNode: focusNode,
            autovalidateMode: autovalidateMode,
            textCapitalization: textCapitalization,
            cursorColor: cursorColor ?? context.colorScheme.primary,
            enableInteractiveSelection: true,
            obscureText: obscure,
            enabled: enabled,
            textInputAction: textInputAction,
            onEditingComplete: () {
              if (nextFocusNode != null) {
                nextFocusNode?.requestFocus();
              } else {
                focusNode?.unfocus();
              }
            },
            onFieldSubmitted: (String value) {
              if (onFieldSubmitted != null) {
                onFieldSubmitted?.call(value);
              }
              if (nextFocusNode != null) {
                nextFocusNode?.requestFocus();
              } else {
                focusNode?.unfocus();
              }
            },
            inputFormatters: inputFormatters,
            maxLines: maxLines,
            decoration: InputDecoration(
              border: border,
              enabledBorder: border,
              disabledBorder: border,
              focusedBorder: border?.copyWith(
                borderSide: BorderSide(
                  color: context.colorScheme.primary,
                ),
              ),
              errorBorder: border?.copyWith(
                borderSide: BorderSide(
                  color: context.colorScheme.error,
                ),
              ),
              filled: filled,
              fillColor: fillColor,
              labelText: labelInTextField ? labelText : null,
              labelStyle: labelTextStyle,
              hintText: hintText,
              hintStyle: hintStyle ?? context.textStyle.textFieldHint,
              errorStyle: context.textStyle.textFieldLabel.copyWith(
                color: context.colorScheme.error,
              ),
              errorText: errorText,
              suffix: suffix,
              suffixIcon: suffixIcon,
              prefix: prefix,
              prefixText: prefixText,
              prefixStyle: prefixTextStyle,
              suffixText: suffixText,
              suffixStyle: suffixTextStyle,
              prefixIcon: prefixIcon,
              prefixIconConstraints: const BoxConstraints(),
              contentPadding: contentPadding ?? const EdgeInsets.fromLTRB(16, 8, 16, 8),
            ),
            cursorHeight: cursorHeight,
          ),
        ],
      );
}
