import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tana/core/extension/extension.dart';
import 'package:tana/core/utils/utils.dart';
import 'package:tana/core/widgets/button_with_scale.dart';
import '../../../../../../constants/constants.dart';
import '../../../../../../core/widgets/options_bottom_sheet.dart';
import '../../../../../../router/app_routes.dart';
import '../widgets/custom_telegram_button.dart';
import '../widgets/language_selector.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String selectedLanguage = 'ru';

  void onLanguageChanged(String language) {
    setState(() {
      selectedLanguage = language;
      print('Til o\'zgartirildi: $language');
    });
  }

  void _showOtherOptionsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return OptionsBottomSheet(
          title: "Другие варианты",
          description: "Выберите подходящий способ авторизации",
          buttonText: "Войти через Google",
          buttonLeadingIcon: SvgPicture.asset(
            PIcons.google,
            width: 24,
            height: 24,
          ),
          buttonColor: Colors.black,
          onButtonPressed: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: context.color.black22,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Image.asset(
                  'assets/images/bg_login.png',
                  fit: BoxFit.cover,
                  width: size.width,
                  height: size.height,
                ),
                Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      context.color.black22.withValues(alpha: 0.7),
                      context.color.black22.withValues(alpha: 0.2),
                      context.color.black22.withValues(alpha: 1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PUtils.kGap24,
                        LanguageSelector(
                          onLanguageChanged: onLanguageChanged,
                          currentLanguage: selectedLanguage,
                        ),
                        Expanded(child: Container()),
                        Image(
                          image: const AssetImage('assets/images/logo_tana.png'),
                          fit: BoxFit.cover,
                        ),
                        PUtils.kGap24,
                        Text(
                          'Знакомься и ходи \nна мероприятия вместе',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: isSmallScreen ? 22 : 28,
                            fontWeight: FontWeight.w600,
                            color: context.color.white,
                          ),
                        ),
                        PUtils.kGap16,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: CustomTelegramButton(onPressed: () {
                            context.push(Routes.onBoarding);
                          }),
                        ),
                        PUtils.kGap16,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: ButtonWithScale(
                            onPressed: () {
                              _showOtherOptionsBottomSheet(context);
                            },
                            color: context.color.white12,
                            child: Text(
                              "Другие варианты",
                            ),
                          ),
                        ),
                        PUtils.kGap16,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 36.0),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: isSmallScreen ? 12 : 14,
                                color: context.color.color888,
                              ),
                              children: [
                                const TextSpan(text: 'Продолжая, вы принимаете '),
                                TextSpan(
                                  text: 'Условия использования',
                                  style: TextStyle(
                                    color: context.color.white,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()..onTap = () {},
                                ),
                                const TextSpan(text: ' и '),
                                TextSpan(
                                  text: 'Политику конфиденциальности',
                                  style:  TextStyle(
                                    color: context.color.white,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Privacy policy
                                    },
                                ),
                                const TextSpan(
                                  text: ', и подтверждаете, что вам исполнилось 18 лет.',
                                ),
                              ],
                            ),
                          ),
                        ),
                        PUtils.kGap24,
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Проблемы со входом',
                            style: TextStyle(
                              color: context.color.white,
                              fontSize: isSmallScreen ? 12 : 14,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        PUtils.kGap24,
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
