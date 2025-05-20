import 'package:app_links/app_links.dart';

class AppLinkService {
  AppLinkService._();

  static init() async {
    final appLinks = AppLinks();

    appLinks.uriLinkStream.listen((uri) {
      // ...
    });
  }
}
