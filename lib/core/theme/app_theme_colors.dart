part of 'themes.dart';

// A set of colors for the entire app.

// light
const colorLightScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF222222),
  onPrimary: Colors.white,
  surface: Colors.white,
  onSurface: Colors.black,
  secondary: Color(0xFF3DC564),
  onSecondary: Colors.black,
  error: Color(0xFFE9033A),
  onError: Colors.white,
);

// dark
const colorDarkScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF222222),
  onPrimary: Colors.white,
  surface: Colors.black,
  onSurface: Colors.white,
  secondary: Color(0xFF3DC564),
  onSecondary: Colors.black,
  error: Color(0xFFE9033A),
  onError: Colors.white,
);

// custom
class AppThemeColors extends ThemeExtension<AppThemeColors> {
  const AppThemeColors({
    required this.background,
    required this.white,
    required this.black,
    required this.color9f9,
    required this.color888,
    required this.color8b2,
    required this.lightBlue,
    required this.black87,
    required this.black22,
    required this.color564,
    required this.white12,
    required this.white16,
    required this.white24,
    required this.black24,
  });

  final Color background;
  final Color white;
  final Color black;
  final Color color9f9;
  final Color color888;
  final Color color8b2;
  final Color lightBlue;
  final Color black87;
  final Color black22;
  final Color color564;
  final Color white12;
  final Color white16;
  final Color white24;
  final Color black24;

  static AppThemeColors light = AppThemeColors(
    background: Colors.white,
    white: Colors.white,
    black: Colors.black,
    color9f9: const Color(0xFFF9F9F9),
    black24: const Color(0x3D000000),
    color888: const Color(0xFF888888),
    color8b2: const Color(0xFFFFE8B2),
    lightBlue: const Color(0xFFAEEBFF),
    black87: Colors.black87,
    black22: const Color(0xFF222222),
    color564: const Color(0xFF3DC564),
    white12: Colors.white12,
    white16: Color(0x29FFFFFF),
    white24: Colors.white24,
  );

  static AppThemeColors dark = AppThemeColors(
    background: const Color(0xFF28282A),
    white: const Color(0xFF28282A),
    black: const Color(0xFF28282A),
    black87: const Color(0xFF28282A),
    black22: const Color(0xFF222222),
    color9f9: const Color(0xFFF9F9F9),
    color888: const Color(0xFF888888),
    color8b2: const Color(0xFFFFE8B2),
    lightBlue: const Color(0xFFAEEBFF),
    color564: const Color(0xFF3DC564),
    white12: const Color(0xFF28282A),
    white16: const Color(0x3DFFFFFF),
    white24: const Color(0xFF28282A),
    black24: const Color(0x3D000000),
  );

  @override
  ThemeExtension<AppThemeColors> copyWith({
    Color? background,
    Color? white,
    Color? black,
    Color? color9f9,
    Color? white24,
    Color? color888,
    Color? color8b2,
    Color? lightBlue,
    Color? black87,
    Color? black22,
    Color? color564,
    Color? white12,
    Color? white16,
    Color? black24,
  }) {
    return AppThemeColors(
      background: background ?? this.background,
      white: white ?? this.white,
      black: black ?? this.black,
      color9f9: color9f9 ?? this.color9f9,
      color888: color888 ?? this.color888,
      color8b2: color8b2 ?? this.color8b2,
      lightBlue: lightBlue ?? this.lightBlue,
      black87: black87 ?? this.black87,
      black22: black22 ?? this.black22,
      color564: color564 ?? this.color564,
      white12: white12 ?? this.white12,
      white24: white24 ?? this.white24,
      black24: black24 ?? this.black24,
      white16: white16 ?? this.white16,
    );
  }

  @override
  ThemeExtension<AppThemeColors> lerp(
    ThemeExtension<AppThemeColors>? other,
    double t,
  ) {
    if (other is! AppThemeColors) {
      return this;
    }

    return AppThemeColors(
      background: Color.lerp(background, other.background, t)!,
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      color9f9: Color.lerp(color9f9, other.color9f9, t)!,
      color888: Color.lerp(color888, other.color888, t)!,
      color8b2: Color.lerp(color8b2, other.color8b2, t)!,
      black87: Color.lerp(black87, other.black87, t)!,
      lightBlue: Color.lerp(lightBlue, other.lightBlue, t)!,
      black22: Color.lerp(black22, other.black22, t)!,
      color564: Color.lerp(color564, other.color564, t)!,
      white12: Color.lerp(white12, other.white12, t)!,
      white24: Color.lerp(white24, other.white24, t)!,
      black24: Color.lerp(black24, other.black24, t)!,
      white16: Color.lerp(white16, other.white16, t)!,
    );
  }
}
