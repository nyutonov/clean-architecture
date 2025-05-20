part of "themes.dart";

SystemUiOverlayStyle systemLightUiOverlayStyle = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  systemNavigationBarColor: AppThemeColors.light.background,
  statusBarBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarIconBrightness: Brightness.dark,
);

SystemUiOverlayStyle systemDarkUiOverlayStyle = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  systemNavigationBarColor: AppThemeColors.dark.background,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.light,
  systemNavigationBarIconBrightness: Brightness.light,
);

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  platform: TargetPlatform.iOS,
  fontFamily: PConstants.font,
  applyElevationOverlayColor: true,
  extensions: <ThemeExtension<dynamic>>[
    AppThemeColors.light,
    ThemeTextStyles.light,
  ],
  visualDensity: VisualDensity.standard,
  materialTapTargetSize: MaterialTapTargetSize.padded,
  primaryColor: colorLightScheme.primary,
  colorScheme: colorLightScheme,
  scaffoldBackgroundColor: AppThemeColors.light.background,
  cardColor: colorLightScheme.surface,
  canvasColor: colorLightScheme.surface,
  shadowColor: AppThemeColors.light.background,
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: AppThemeColors.light.background,
    shape: RoundedRectangleBorder(
      borderRadius: PUtils.kBorderRadiusTop16,
    ),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: colorLightScheme.primary,
    strokeCap: StrokeCap.round,
  ),
  appBarTheme: AppBarTheme(
    toolbarHeight: kToolbarHeight,
    elevation: 0,
    scrolledUnderElevation: 1,
    systemOverlayStyle: systemLightUiOverlayStyle,
    iconTheme: IconThemeData(
      color: colorLightScheme.primary,
    ),
    shadowColor: AppThemeColors.light.background,
    titleTextStyle: ThemeTextStyles.light.appBarTitle,
    toolbarTextStyle: ThemeTextStyles.light.appBarTitle,
    backgroundColor: AppThemeColors.light.background,
    surfaceTintColor: colorLightScheme.surface,
  ),
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (BuildContext context) => SvgPicture.asset(
      PIcons.arrowLeft,
      colorFilter: ColorFilter.mode(
        colorLightScheme.primary,
        BlendMode.srcIn,
      ),
    ),
  ),
  listTileTheme: ListTileThemeData(
    contentPadding: PUtils.kPaddingSymHor12,
    minVerticalPadding: 0,
    tileColor: AppThemeColors.light.color9f9,
    titleTextStyle: ThemeTextStyles.light.listTileTitle,
    subtitleTextStyle: ThemeTextStyles.light.listTileSubtitle,
    shape: RoundedRectangleBorder(
      borderRadius: PUtils.kBorderRadius12,
    ),
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: colorLightScheme.surface,
  ),
  sliderTheme: SliderThemeData(
    activeTrackColor: colorLightScheme.secondary,
    inactiveTrackColor: AppThemeColors.light.color9f9,
    thumbColor: colorLightScheme.secondary,
    trackHeight: 1,
    valueIndicatorColor: colorLightScheme.secondary,
  ),
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  platform: TargetPlatform.iOS,
  fontFamily: PConstants.font,
  applyElevationOverlayColor: true,
  extensions: <ThemeExtension<dynamic>>[
    AppThemeColors.dark,
    ThemeTextStyles.dark,
  ],
  visualDensity: VisualDensity.standard,
  materialTapTargetSize: MaterialTapTargetSize.padded,
  primaryColor: colorDarkScheme.primary,
  colorScheme: colorDarkScheme,
  scaffoldBackgroundColor: AppThemeColors.dark.background,
  cardColor: colorDarkScheme.surface,
  canvasColor: colorDarkScheme.surface,
  shadowColor: AppThemeColors.dark.background,
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: AppThemeColors.dark.background,
    shape: RoundedRectangleBorder(
      borderRadius: PUtils.kBorderRadiusTop16,
    ),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: colorDarkScheme.primary,
    strokeCap: StrokeCap.round,
  ),
  appBarTheme: AppBarTheme(
    toolbarHeight: kToolbarHeight,
    elevation: 0,
    scrolledUnderElevation: 1,
    systemOverlayStyle: systemDarkUiOverlayStyle,
    iconTheme: IconThemeData(
      color: colorDarkScheme.primary,
    ),
    shadowColor: AppThemeColors.dark.background,
    titleTextStyle: ThemeTextStyles.dark.appBarTitle,
    toolbarTextStyle: ThemeTextStyles.dark.appBarTitle,
    backgroundColor: AppThemeColors.dark.background,
    surfaceTintColor: colorDarkScheme.surface,
  ),
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (BuildContext context) => SvgPicture.asset(
      PIcons.arrowLeft,
      colorFilter: ColorFilter.mode(
        colorDarkScheme.primary,
        BlendMode.srcIn,
      ),
    ),
  ),
  listTileTheme: ListTileThemeData(
    contentPadding: PUtils.kPaddingSymHor12,
    minVerticalPadding: 0,
    tileColor: AppThemeColors.dark.color9f9,
    titleTextStyle: ThemeTextStyles.dark.listTileTitle,
    subtitleTextStyle: ThemeTextStyles.dark.listTileSubtitle,
    shape: RoundedRectangleBorder(
      borderRadius: PUtils.kBorderRadius12,
    ),
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: colorDarkScheme.surface,
  ),
  sliderTheme: SliderThemeData(
    activeTrackColor: colorDarkScheme.secondary,
    inactiveTrackColor: AppThemeColors.dark.color9f9,
    thumbColor: colorDarkScheme.secondary,
    trackHeight: 1,
    valueIndicatorColor: colorDarkScheme.secondary,
  ),
);
