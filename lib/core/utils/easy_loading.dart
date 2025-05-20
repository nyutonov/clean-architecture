part of "utils.dart";

void configEasyLoading() {
  EasyLoading.instance
    ..contentPadding = const EdgeInsets.all(16)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..indicatorWidget = CircularProgressIndicator(
      color: Color(0xFF222222),
      strokeCap: StrokeCap.round,
    )
    ..radius = 100
    ..userInteractions = false
    ..maskType = EasyLoadingMaskType.black
    ..loadingStyle = EasyLoadingStyle.dark;
}