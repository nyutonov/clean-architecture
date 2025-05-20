import 'package:ansicolor/ansicolor.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/date_symbols.dart';
import 'package:tana/core/models/language_model.dart';

import 'app.dart';
import 'core/flutter_native_splash/flutter_native_splash.dart';
import 'core/service/app_link_service.dart';
import 'core/utils/utils.dart';
import 'injector_container.dart' as di;

DateSymbols symbols = dateTimeSymbolMap()["uz"];

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  ansiColorDisabled = false;
  configEasyLoading();
  AppLinkService.init();
  await EasyLocalization.ensureInitialized();
  await di.init();
  await initializeDateFormatting(di.localSource.locale);

  symbols = dateTimeSymbolMap()[di.localSource.locale];

  runApp(
    EasyLocalization(
      useOnlyLangCode: true,
      supportedLocales: List.generate(languages.length, (index) {
        return Locale(
          languages[index].code,
        );
      }),
      path: 'assets/locale',
      fallbackLocale: Locale(di.localSource.locale),
      startLocale: Locale(di.localSource.locale),
      child: DevicePreview(
        enabled: false,
        builder: (context) => const App(),
      ),
    ),
  );

  FlutterNativeSplash.remove();
}
