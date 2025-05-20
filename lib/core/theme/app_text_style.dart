part of 'themes.dart';

class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> {
  final TextStyle elevatedButtonText;
  final TextStyle disabledElevatedButtonText;
  final TextStyle appBarTitle;
  final TextStyle authTitle;
  final TextStyle authDescription;
  final TextStyle textFieldLabel;
  final TextStyle textFieldError;
  final TextStyle textFieldHint;
  final TextStyle textFieldMain;
  final TextStyle dialogTitle;
  final TextStyle listTileTitle;
  final TextStyle listTileSubtitle;
  final TextStyle selectedBottomBar;
  final TextStyle unselectedBottomBar;

  const ThemeTextStyles({
    required this.elevatedButtonText,
    required this.disabledElevatedButtonText,
    required this.appBarTitle,
    required this.authTitle,
    required this.authDescription,
    required this.textFieldLabel,
    required this.textFieldError,
    required this.textFieldHint,
    required this.textFieldMain,
    required this.dialogTitle,
    required this.listTileTitle,
    required this.listTileSubtitle,
    required this.selectedBottomBar,
    required this.unselectedBottomBar,
  });

  static ThemeTextStyles light = ThemeTextStyles(
    elevatedButtonText: customTextStyle(
      color: AppThemeColors.light.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    disabledElevatedButtonText: customTextStyle(
      color: AppThemeColors.light.black,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    appBarTitle: customTextStyle(
      color: colorLightScheme.primary,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    authTitle: customTextStyle(
      color: colorLightScheme.primary,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    authDescription: customTextStyle(
      color: AppThemeColors.light.color888,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    textFieldLabel: customTextStyle(
      color: AppThemeColors.light.color888,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    textFieldError: customTextStyle(
      color: colorLightScheme.error,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    textFieldHint: customTextStyle(
      color: AppThemeColors.light.color888,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    textFieldMain: customTextStyle(
      color: colorLightScheme.primary,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    dialogTitle: customTextStyle(
      color: colorLightScheme.primary,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    listTileTitle: customTextStyle(
      color: colorLightScheme.primary,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    listTileSubtitle: customTextStyle(
      color: AppThemeColors.light.color888,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    selectedBottomBar: customTextStyle(
      color: colorLightScheme.secondary,
      fontSize: 10,
      fontWeight: FontWeight.w600,
    ),
    unselectedBottomBar: customTextStyle(
      color: AppThemeColors.light.color888,
      fontSize: 10,
      fontWeight: FontWeight.w600,
    ),
  );

  static ThemeTextStyles dark = ThemeTextStyles(
    elevatedButtonText: customTextStyle(
      color: AppThemeColors.dark.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    disabledElevatedButtonText: customTextStyle(
      color: AppThemeColors.dark.black,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    appBarTitle: customTextStyle(
      color: colorDarkScheme.primary,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    authTitle: customTextStyle(
      color: colorDarkScheme.primary,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    authDescription: customTextStyle(
      color: AppThemeColors.dark.color888,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    textFieldLabel: customTextStyle(
      color: AppThemeColors.dark.color888,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    textFieldError: customTextStyle(
      color: colorDarkScheme.error,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    textFieldHint: customTextStyle(
      color: AppThemeColors.dark.color888,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    textFieldMain: customTextStyle(
      color: colorDarkScheme.primary,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    dialogTitle: customTextStyle(
      color: colorDarkScheme.primary,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    listTileTitle: customTextStyle(
      color: colorDarkScheme.primary,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    listTileSubtitle: customTextStyle(
      color: AppThemeColors.dark.color888,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    selectedBottomBar: customTextStyle(
      color: colorDarkScheme.secondary,
      fontSize: 10,
      fontWeight: FontWeight.w600,
    ),
    unselectedBottomBar: customTextStyle(
      color: AppThemeColors.dark.color888,
      fontSize: 10,
      fontWeight: FontWeight.w600,
    ),
  );

  @override
  ThemeExtension<ThemeTextStyles> copyWith({
    TextStyle? elevatedButtonText,
    TextStyle? disabledElevatedButtonText,
    TextStyle? appBarTitle,
    TextStyle? authTitle,
    TextStyle? authDescription,
    TextStyle? textFieldLabel,
    TextStyle? textFieldError,
    TextStyle? textFieldHint,
    TextStyle? textFieldMain,
    TextStyle? dialogTitle,
    TextStyle? listTileTitle,
    TextStyle? listTileSubtitle,
    TextStyle? selectedBottomBar,
    TextStyle? unselectedBottomBar,
  }) {
    return ThemeTextStyles(
      elevatedButtonText: elevatedButtonText ?? this.elevatedButtonText,
      disabledElevatedButtonText: disabledElevatedButtonText ?? this.disabledElevatedButtonText,
      appBarTitle: appBarTitle ?? this.appBarTitle,
      authTitle: authTitle ?? this.authTitle,
      authDescription: authDescription ?? this.authDescription,
      textFieldLabel: textFieldLabel ?? this.textFieldLabel,
      textFieldError: textFieldError ?? this.textFieldError,
      textFieldHint: textFieldHint ?? this.textFieldHint,
      textFieldMain: textFieldMain ?? this.textFieldMain,
      dialogTitle: dialogTitle ?? this.dialogTitle,
      listTileTitle: listTileTitle ?? this.listTileTitle,
      listTileSubtitle: listTileSubtitle ?? this.listTileSubtitle,
      selectedBottomBar: selectedBottomBar ?? this.selectedBottomBar,
      unselectedBottomBar: unselectedBottomBar ?? this.unselectedBottomBar,
    );
  }

  @override
  ThemeExtension<ThemeTextStyles> lerp(ThemeExtension<ThemeTextStyles>? other, double t) {
    if (other is! ThemeTextStyles) {
      return this;
    }

    return ThemeTextStyles(
      elevatedButtonText: TextStyle.lerp(elevatedButtonText, other.elevatedButtonText, t)!,
      disabledElevatedButtonText: TextStyle.lerp(disabledElevatedButtonText, other.disabledElevatedButtonText, t)!,
      appBarTitle: TextStyle.lerp(appBarTitle, other.appBarTitle, t)!,
      authTitle: TextStyle.lerp(authTitle, other.authTitle, t)!,
      authDescription: TextStyle.lerp(authDescription, other.authDescription, t)!,
      textFieldLabel: TextStyle.lerp(textFieldLabel, other.textFieldLabel, t)!,
      textFieldError: TextStyle.lerp(textFieldError, other.textFieldError, t)!,
      textFieldHint: TextStyle.lerp(textFieldHint, other.textFieldHint, t)!,
      textFieldMain: TextStyle.lerp(textFieldMain, other.textFieldMain, t)!,
      dialogTitle: TextStyle.lerp(dialogTitle, other.dialogTitle, t)!,
      listTileTitle: TextStyle.lerp(listTileTitle, other.listTileTitle, t)!,
      listTileSubtitle: TextStyle.lerp(listTileSubtitle, other.listTileSubtitle, t)!,
      selectedBottomBar: TextStyle.lerp(selectedBottomBar, other.selectedBottomBar, t)!,
      unselectedBottomBar: TextStyle.lerp(unselectedBottomBar, other.unselectedBottomBar, t)!,
    );
  }
}

TextStyle customTextStyle({
  required FontWeight fontWeight,
  required double fontSize,
  required Color color,
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    overflow: TextOverflow.ellipsis,
    fontFamily: PConstants.font,
  );
}
