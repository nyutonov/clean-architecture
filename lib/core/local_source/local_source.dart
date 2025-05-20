import "package:flutter/material.dart";
import "package:hive/hive.dart";
import "package:intl/date_symbol_data_local.dart";
import "package:tana/core/utils/utils.dart";
import "package:tana/main.dart";

import "../../constants/constants.dart";

final class LocalSource {
  LocalSource(this.box);

  final Box<dynamic> box;

  // locale

  String get locale {
    return box.get(PKeys.locale, defaultValue: defaultLocale);
  }

  Future<void> setLocale(String locale) async {
    await initializeDateFormatting(locale);
    symbols = dateTimeSymbolMap()[locale];

    await box.put(PKeys.locale, locale);
  }

  // theme mode

  ThemeMode get themeMode => switch (box.get(PKeys.themeMode, defaultValue: "system")) {
        "system" => ThemeMode.system,
        "light" => ThemeMode.light,
        "dark" => ThemeMode.dark,
        _ => ThemeMode.light,
      };

  Future<void> setThemeMode(ThemeMode mode) async {
    await box.put(PKeys.themeMode, mode.name);
  }

  // access token

  String get accessToken {
    return box.get(PKeys.accessToken, defaultValue: "");
  }

  Future<void> setAccessToken(String accessToken) async {
    await box.put(PKeys.accessToken, accessToken);
  }

  // refresh token

  Future<void> setRefreshToken(String refreshToken) async {
    await box.put(PKeys.refreshToken, refreshToken);
  }

  String get refreshToken {
    return box.get(PKeys.refreshToken, defaultValue: "");
  }

  // user id

  Future<void> setUserId(int userId) async {
    await box.put(PKeys.userId, userId);
  }

  String get userId {
    return box.get(PKeys.userId, defaultValue: 0);
  }

  // first name

  Future<void> setFirstName(String firstName) async {
    await box.put(PKeys.firstname, firstName);
  }

  String get firstName {
    return box.get(PKeys.firstname, defaultValue: "");
  }

  // last name

  Future<void> setLastName(String userName) async {
    await box.put(PKeys.lastname, userName);
  }

  String get lastName {
    return box.get(PKeys.lastname, defaultValue: "");
  }

  // phone

  Future<void> setPhone(String phone) async {
    await box.put(PKeys.phone, phone);
  }

  String get phone {
    return box.get(PKeys.phone, defaultValue: "");
  }

  // phone

  Future<void> setAvatar(String avatar) async {
    await box.put(PKeys.avatar, avatar);
  }

  String get avatar {
    return box.get(PKeys.avatar, defaultValue: "");
  }

  Future<void> clearUserData() async {
    await box.delete(PKeys.accessToken);
    await box.delete(PKeys.refreshToken);
    await box.delete(PKeys.userId);
    await box.delete(PKeys.avatar);
    await box.delete(PKeys.firstname);
    await box.delete(PKeys.lastname);
    await box.delete(PKeys.phone);
    await box.delete(PKeys.password);
  }

  bool get isUserLoggedIn => accessToken.isNotEmpty;

  Future<void> clear() async {
    await box.clear();
  }
}
