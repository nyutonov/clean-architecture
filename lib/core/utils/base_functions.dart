part of "utils.dart";

final String defaultSystemLocale = Platform.localeName.split("_").first;

String get defaultLocale => switch (defaultSystemLocale) {
      "ru" => "ru",
      "en" => "en",
      "uz" => "uz",
      _ => "ru",
    };

String get defaultTheme => SchedulerBinding.instance.platformDispatcher.platformBrightness.name;

String priceFormat(num price) {
  return "${intl.NumberFormat.currency(locale: 'uz').format(price).substring(0, intl.NumberFormat.currency(locale: 'uz').format(price).length - 7)} ${"main.sum".tr()}";
}

String numberFormat(int k) {
  if (k > 9) {
    return k.toString();
  } else {
    return "0$k";
  }
}

String phoneFormat(String phone) {
  try {
    return "${phone.substring(0, 4)} ${phone.substring(4, 6)} ${phone.substring(6, 9)} ${phone.substring(9, 11)} ${phone.substring(11, 13)}";
  } catch (e) {
    return phone;
  }
}

bool doesTextFit(String text, TextStyle style, double maxWidth) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: 1,
    textDirection: TextDirection.ltr,
  )..layout(
      maxWidth: maxWidth,
    );

  return textPainter.didExceedMaxLines == false;
}

Future<void> openTelegram({
  String? username,
}) async {
  final telegramUri = (username != null) ? Uri.parse('tg://resolve?domain=$username') : Uri.parse('tg://');
  final playStoreUri = Uri.parse('https://play.google.com/store/apps/details?id=org.telegram.messenger');
  final appStoreUri = Uri.parse('https://apps.apple.com/app/telegram-messenger/id686449807');

  if (await canLaunchUrl(telegramUri)) {
    await launchUrl(telegramUri);
  } else {
    // Telegram app not found, open store page
    final fallbackUri = Platform.isAndroid ? playStoreUri : appStoreUri;
    if (await canLaunchUrl(fallbackUri)) {
      await launchUrl(fallbackUri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not open Telegram or app store.');
    }
  }
}
