import "dart:async";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_easyloading/flutter_easyloading.dart";
import "package:go_router/go_router.dart";
import "package:internet_connection_checker/internet_connection_checker.dart";
import "package:tana/core/extension/extension.dart";

import "../../../injector_container.dart";
import "../utils/utils.dart";

class InternetConnectionScreen extends StatefulWidget {
  const InternetConnectionScreen({super.key});

  @override
  InternetConnectionScreenState createState() => InternetConnectionScreenState();
}

class InternetConnectionScreenState extends State<InternetConnectionScreen> {
  late StreamSubscription<InternetConnectionStatus> listener;

  @override
  void initState() {
    super.initState();

    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }

    listener = networkInfo.onStatusChange.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(InternetConnectionStatus status) async {
    switch (status) {
      case InternetConnectionStatus.connected:
        context.pop();
      case InternetConnectionStatus.disconnected:
        break;
    }
  }

  @override
  void dispose() {
    unawaited(listener.cancel());

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          systemNavigationBarColor: context.color.background,
        ),
        child: Scaffold(
          backgroundColor: context.color.background,
          body: Padding(
            padding: PUtils.kPaddingSymHor16,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<StreamSubscription<InternetConnectionStatus>>(
        "listener",
        listener,
      ),
    );
  }
}
